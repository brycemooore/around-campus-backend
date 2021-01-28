# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# bryce = User.first
# jj = User.second
# con = Conversation.first 
# x = [bryce.id, jj.id]
# y = ["hey", "hell", "whats up"]
# 10.times do 
#     Message.create(user_id: x.sample, conversation_id: con.id, body: y.sample)
# end 

School.create(name: 'University of Virginia', location: 'Charlottesville')
School.create(name: 'George Mason', location: 'Fairfax')
School.create(name: 'Virgina Commonwealth University', location: 'Richmond')
School.create(name: 'Christoher Newport University', location: 'Norfolk')
School.create(name: 'Old Dominion University', location: 'Norfolk')
