# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do 
  Event.create(actor: Faker::Name.name, action: "was born", description: ["healthy", nil].sample, day: 01, month: 01, year: 2000)
end

Event.create(actor: Faker::Name.name, action: "was born", description: ["healthy", nil].sample, day: 02, month: 01, year: 2000)