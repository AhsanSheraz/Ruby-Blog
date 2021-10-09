class Post < ApplicationRecord
  belongs_to :user

  # a post can have multiple ratings
  has_many :rating
end
