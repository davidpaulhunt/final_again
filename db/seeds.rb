# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sports = Sport.create([{ name: "football" }])

positions = Position.create([ {name: "quarterback", abbreviation: "qb", sport: sports.first}, {name: "running back", abbreviation: "rb", sport: sports.first},{name: "wide receiver", abbreviation: "wr", sport: sports.first},{name: "tight end", abbreviation: "te", sport: sports.first},{name: "offensive tackle", abbreviation: "ot", sport: sports.first},{name: "offensive guard", abbreviation: "og", sport: sports.first},{name: "center", abbreviation: "c", sport: sports.first},{name: "fullback", abbreviation: "fb", sport: sports.first} ])