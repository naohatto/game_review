class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  #before_action :ensure_posts, only: [:new, :edit, :create, :update, :destroy]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:create] = "You have created review successfully."
      redirect_to post_path(@post.id)
    else
      @customer = current_customer
      @posts = Post.page(params[:page])
      render :index
    end
  end

  def index
    @posts = Post.page(params[:page])
    @customer = current_customer
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @customer = @post.customer
  end


  def edit
    @post = Post.find(params[:id])
    if @post.customer != current_customer
      redirect_to '/posts'
    end
  end

  def update
    upost = Post.find(params[:id])
    if upost.update(post_params)
      flash[:updateb] = 'You have updated book successfully.'
      redirect_to post_path(upost.id)
    else
      @post = Post.find(params[:id])
      flash[:errorudb] = 'update error'
      render :edit
    end
  end




  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_path(current_customer)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :rate, :customer_id)
  end

  #def ensure_posts

  #end


end
