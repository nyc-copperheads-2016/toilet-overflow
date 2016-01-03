class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers, :comments).find(params[:id])
    @answer = @question.answers.includes(:comments)
  end
end
