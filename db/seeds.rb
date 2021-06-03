# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Chatroom.destroy_all
User.destroy_all

p 'cleaned database'

User.create!(first_name: 'Henrik', last_name: 'Duerrfeld', username: 'admin1', email: 'henrik.duerrfeld.20002@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north' )
User.create!(first_name: 'julien', last_name: 'Dumont', username: 'admin2', email: 'julien@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
User.create!(first_name: 'jules', last_name: 'Dumont', username: 'admin3', email: 'julin@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
User.create!(first_name: 'lien', last_name: 'Dumont', username: 'admin4', email: 'jlien@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
User.create!(first_name: 'julin', last_name: 'Dumont', username: 'admin5', email: 'julien@gmal.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
User.create!(first_name: 'juien', last_name: 'Dumont', username: 'admin6', email: 'julie@gmail.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
User.create!(first_name: 'juien', last_name: 'Dumont', username: 'admin7', email: 'julien@gma.com', password: '123456', rank: 'Silver I', age: 18, language: 'English', style: 'Fragger', region: 'EU north')
Chatroom.create
Chatroom.create
