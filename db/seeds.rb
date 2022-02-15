# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user1 = User.create!(name: 'user1', email: 'user1@mail.com', password: '123456', confirmed_at: Time.now)
@group1 = Group.create!(user_id: @user1.id, name: 'Food', icon: 'food-icon')
@group2 = Group.create!(user_id: @user1.id, name: 'Sports', icon: 'sport-icon')