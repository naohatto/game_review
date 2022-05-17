class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:create] = "You have created book successfully."
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
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :genre_id, :rate, :customer_id)
  end


end
