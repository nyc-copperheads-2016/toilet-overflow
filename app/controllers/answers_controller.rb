class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    answer = Answer.find_by(id: params[:answer][:id])
    answer.update_attributes(chosen: true)
    if answer.save
      redirect_to root_path
    else
      redirect_to question_path(answer.question.id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
