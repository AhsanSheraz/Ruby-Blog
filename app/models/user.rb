class User < ApplicationRecord
    # initialize auth_token with some random secure string
    before_create -> { self.auth_token = SecureRandom.hex }

    # a user can have and add multiple posts
    has_many :post
end
