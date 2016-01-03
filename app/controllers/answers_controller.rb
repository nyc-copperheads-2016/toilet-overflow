class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end
  def show
    @answer = Answer.find_by(id: params[:id])
  end
end