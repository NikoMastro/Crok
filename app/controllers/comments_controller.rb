class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to home_path
    else
      redirect_to home_path, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    p params
    params.require(:comment).permit(:content, :task_id)
  end
end
