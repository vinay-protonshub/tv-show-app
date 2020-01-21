# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)





# CHANNELS
amc = Channel.create(name: "AMC")
usa = Channel.create(name: "USA")
hbo = Channel.create(name: "HBO")
netflix = Channel.create(name: "Netflix Original")

# SHOWS
terror = Show.create( title: 'The Terror',
                      description: 'A fictionalized account of Captain Sir John Franklin\'s lost expedition to the Arctic',
                      day: 'Tue',
                      time: '8:00 PM',
                      current_season: 1 )
terror.channel = amc
terror.save

mr_robot = Show.create( title: 'Mr. Robot',
                      description: 'A hacker joins a group of hacktivists to destroy all deb records',
                      current_season: 3 )

mr_robot.channel = usa
mr_robot.save

got = Show.create( title: 'Game of Thrones',
                      description: 'A fantasty drama series adapted from George R.R. Martin\'s novels',
                      current_season: 7 )

got.channel = hbo
got.save

lost_in_space = Show.create( title: 'Lost in Space',
                      description: 'Following the adventures of a family of pioneering space colonists whose ship veers off-course',
                      current_season: 1 )

lost_in_space.channel = netflix
lost_in_space.save
