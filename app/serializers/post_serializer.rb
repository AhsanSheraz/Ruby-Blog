class PostSerializer < ActiveModel::Serializer
  attributes :title, :context, :created_at
end
