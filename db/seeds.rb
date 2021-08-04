# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
competition_1 = Competition.create!(name: 'Champions League', location: 'Italy', sport: 'Soccer')
competition_2 = Competition.create!(name: 'Europa League', location: 'Germany', sport: 'Soccer')

team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')
team_3 = Team.create!(hometown: 'Newcastle', nickname: 'The Magpies')

CompetitionEntry.create!(team: team_1, competition: competition_1)
CompetitionEntry.create!(team: team_2, competition: competition_1)
CompetitionEntry.create!(team: team_2, competition: competition_2)
CompetitionEntry.create!(team: team_3, competition: competition_2)

player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: team_1.id)
player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: team_1.id)
player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: team_2.id)
player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: team_2.id)
player_5 = Player.create!(name: "Callum Wilson", age: 30, team_id: team_3.id)
