class VotesController < ApplicationController
  before_filter :load_voteable

  def create
    # byebug
    @vote = @voteable.votes.new(vote: 0,user: current_user)
    if params[:commit] == "upvote"
      @vote.update_attributes(vote: 1)
    else
      @vote.update_attributes(vote: -1)
    end
    if @vote.save
      redirect_to root_path
    else
      redirect_to question_path(params[:question_id])
    end
  end

private
  def load_voteable
    resource, id = request.path.split('/')[1, 2]
    @voteable = resource.singularize.classify.constantize.find(id)
  end

end
