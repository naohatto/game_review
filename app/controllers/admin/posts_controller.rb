class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_post, only: [:show, :update]

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

  def ensure_post
    @post = Post.find(params[:id])
  end


end
