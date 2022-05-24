class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.order("rate DESC")
  end

  def about
  end
end
