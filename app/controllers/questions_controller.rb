class QuestionsController < ApplicationController
  before_action :ensure_logged_in, only:[:new, :create, :update]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers, :comments).find(params[:id])
    @answer = @question.answers.includes(:comments)
    @fav_answer = @question.answers.where(chosen: true)
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

  def separate_tags_and_save(tagging, question)
    tagging.split(",").each do |tag|
      tag.downcase.gsub(/,\s+/,"")
      question.tags.find_or_create_by(name: tag)
    end
  end

end
