class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :context, :created_at

  # # a post can have many ratings, so it will return rating against post
  # has_many :rating
end
