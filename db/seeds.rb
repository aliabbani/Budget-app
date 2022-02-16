# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user1 = User.create!(name: 'user1', email: 'user1@mail.com', password: '123456', confirmed_at: Time.now)
@user2 = User.create!(name: 'user2', email: 'user2@mail.com', password: '123456', confirmed_at: Time.now)

@group1 = Group.create!(user: @user1, name: 'Food', icon: 'food-icon')
@group2 = Group.create!(user: @user1, name: 'Sports', icon: 'sport-icon')

@entity1 = @group1.entities.create!(user: @user1, name: 'entity1', amount: 5)
@entity2 = @group1.entities.create!(user: @user1, name: 'entity2', amount: 10)