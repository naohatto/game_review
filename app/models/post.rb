class Post < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  belongs_to :customer
  belongs_to :genre

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :rate,presence:true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
