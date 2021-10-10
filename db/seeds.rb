# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require "base64"

# To create a 100 user records we need to define a loop to generate users in DB
for i in 1..100
    u1 = User.create(email: 'user'+i.to_s+'@example.com', password: Base64.encode64('password'))

    # Create 2000 posts against each user to make it 200k posts
    for j in 1..2000
        p1 = u1.post.create(title: 'Post Number '+j.to_s, context: 'This post is against user '+i.to_s, user_ip: '192.168.0.'+i.to_s)

        # There is an if condition to rate some of the post
        if j % 3 == 0
            p1.rating.create(rate: 1)
        elsif j % 5 == 0
            p1.rating.create(rate: 3)
        elsif j % 8 == 0
            p1.rating.create(rate: 5)
        end
    end
end


# u2 = User.create(email: 'user2@example.com', password: 'password')
 
# p1 = u1.post.create(title: 'First Post', context: 'An Airplane', user_ip: '192.168.0.1')
# p2 = u1.post.create(title: 'Second Post', context: 'A Train', user_ip: '192.168.0.1')
 
# r1 = p1.rating.create(rate: 1)
# r2 = p2.rating.create(rate: 4)