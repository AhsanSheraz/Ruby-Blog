class User < ApplicationRecord

    # a user can have and add multiple posts
    has_many :post
end
