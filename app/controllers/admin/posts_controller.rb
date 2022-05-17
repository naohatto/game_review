class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end


  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :rate, :customer_id)
  end


end
