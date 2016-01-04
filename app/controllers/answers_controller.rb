class AnswersController < ApplicationController
  def index
    @answers = Answer.all
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
end
