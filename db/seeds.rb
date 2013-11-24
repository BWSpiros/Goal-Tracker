# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new({username: "Batman", password: "robin"})
u.save
u = User.new({username: "Superman", password: "dailyglobe"})
u.save
u = User.new({username: "Brian", password: "kadie"})
u.save
u = User.new({username: "Luke", password: "ihearthodis"})
u.save

g = Goal.new({user_id: 1, is_private: false, title: "Base jump without a Parachute", description: "daunting", status: "Incomplete"})
g.save
g = Goal.new({user_id: 2, is_private: false, title: "Get Laser Eye Surgery", description: "Wearing glasses is irritating", status: "Incomplete"})
g.save
g = Goal.new({user_id: 3, is_private: false, title: "Finish this course", description: "need giant nap", status: "Incomplete"})
g.save
g = Goal.new({user_id: 4, is_private: false, title: "Sail faster", description: "need more wind", status: "Incomplete"})
g.save