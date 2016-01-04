class CommentsController < ApplicationController
  before_filter :load_commentable


  def new
    @comment = @commentable.comments.new
  end

  def create
    # byebug
    @comment = @commentable.comments.new(content: params[:comment][:content],user: current_user)
    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

private
  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
