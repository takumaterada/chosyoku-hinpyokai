class Post < ApplicationRecord

  belongs_to :genre
  belongs_to :user
  has_many :post_comments
  has_many :favorites
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_one_attached :post_image

end
