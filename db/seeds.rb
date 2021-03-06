# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

(1..20).each do |i|
  Event.create!(
    title: "Lipsum Event #{i}",
    start_date: "#{Date.today}",
    end_date: "#{Date.today}",
    description: %{Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum.},
    category: "celebrities",
    address: "#{i} Middle Lane",
    city: "San Francisco",
    state: "CA",
    telephone: "443 748 4938",
    email: "example@mail.com")
end

Article.create!(title: "Rihanna Fun", author: "George Williams", body: %{What if I want to eat three pizzas in a row? Is it a great big pizza?"})

(1..100).each do |i|
  Article.create!(title: "Lipsum Post #{i}", author: "Peter Piper", body: %{
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. In feugiat purus dapibus fermentum sagittis. Fusce in tempus felis. Phasellus a erat ut lorem lacinia bibendum. Vivamus viverra facilisis neque, in scelerisque urna pharetra vel. Donec a est mauris. Integer eget metus quis eros egestas elementum. Integer bibendum risus hendrerit dapibus tempor. Fusce placerat in orci vitae tincidunt.
  })
end