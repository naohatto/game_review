class Genre < ApplicationRecord

  has_many :posts

  validates :name,length: { minimum: 2, maximum: 20 },  presence: true

end
