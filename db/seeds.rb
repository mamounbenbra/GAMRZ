# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Chatroom.destroy_all
User.create!(first_name: 'Henrik', last_name: 'Duerrfeld', username: 'admin1', email: 'henrik.duerrfeld.20002@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU' )
User.create!(first_name: 'julien', last_name: 'Dumont', username: 'admin2', email: 'julien@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU')
Chatroom.create