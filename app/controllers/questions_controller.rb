class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers, :comments).find(params[:id])
    @answer = @question.answers.includes(:comments)
  end

  def new
    @question = Question.new
  end

  def create
    question = current_user.questions.new(question_params)
    if question.save
      separate_tags_and_save(params[:tags], question)
      redirect_to questions_path
    else
      @question = Question.new
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:question_title, :content)
  end

  def separate_tags_and_save(tags, question)
    tags.downcase.gsub(/,\s+/,"").split(",").each do |tag|
      question.tags.find_or_create_by(name: tag)
    end
  end


end
