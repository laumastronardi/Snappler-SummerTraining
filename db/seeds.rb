# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create(name: "Usuario 1", age: 20)

user2 = User.create(name: "Usuario 2", age: 25)
user3 = User.create(name: "Usuario 3", age: 25)
user4 = User.create(name: "Usuario 4", age: 25)

Follow.create(follower_id: user2.id, followed_user_id: user1.id)
Follow.create(follower_id: user3.id, followed_user_id: user1.id)
Follow.create(follower_id: user4.id, followed_user_id: user1.id)
Follow.create(follower_id: user1.id, followed_user_id: user2.id)
Follow.create(follower_id: user2.id, followed_user_id: user3.id)
Follow.create(follower_id: user1.id, followed_user_id: user3.id)