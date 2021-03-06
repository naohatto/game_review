class Public::PostCommentsController < ApplicationController
  def create
    cpost = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = cpost.id
    comment.save
    redirect_to post_path(cpost)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end


end
