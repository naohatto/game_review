class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @posts = Post.page(params[:page])
    @post = Post.find(params[:id])
    @customer = @post.customer
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_customer_path(current_admin)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :rate, :customer_id)
  end

  def ensure_post
    @post = Post.find(params[:id])
  end


end
