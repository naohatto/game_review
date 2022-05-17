class Post < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  belongs_to :customer
  belongs_to :genre

end
