class CommentsController < ApplicationController
  before_action :ensure_logged_in, only:[:new, :create, :update]

  def create
    @comment = Question.find(params[:question_id])
    @comments = @commentable.comments
    if comment.save

    else

    end
  end

  private

  def comment_params
    params.require(:comment).permit(:question_title, :content)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end
