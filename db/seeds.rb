# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

josh = User.create(first_name: 'Josh', 
                  last_name: 'Begin', 
                  email: 'joshbegin@gmail.com', 
                  password: 'admin321', 
                  password_confirmation: 'admin321')
puts josh
josh.toggle!(:active)
puts "Made active"
josh.toggle!(:admin)
puts "Made admin"