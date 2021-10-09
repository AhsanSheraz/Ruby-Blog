class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at

  # # a user can have multiple posts, so it will return posts against user
  # has_many :post
end
