require 'rails_helper'

RSpec.describe 'Registeration page' do
  it 'can add a team to the competition' do
    competition_1 = Competition.create!(name: 'Champions League', location: 'Italy', sport: 'Soccer')

    team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
    team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')
    team_3 = Team.create!(hometown: 'Newcastle', nickname: 'The Magpies')

    CompetitionEntry.create!(team: team_1, competition: competition_1)
    CompetitionEntry.create!(team: team_2, competition: competition_1)

    player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: team_1.id)
    player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: team_1.id)
    player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: team_2.id)
    player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: team_2.id)
    player_5 = Player.create!(name: "Callum Wilson", age: 30, team_id: team_3.id)
    player_6 = Player.create!(name: "Ezze Alwafai", age: 35, team_id: team_3.id)

    visit "/competitions/#{competition_1.id}/competition_entries/new"

    fill_in :nickname, with: 'The Magpies'
    fill_in :hometown, with: 'Newcastle'

    click_button 'Register'

    expect(current_path).to eq("/competitions/#{competition_1.id}")
    expect(page).to have_content(team_3.nickname)
    expect(page).to have_content(team_3.hometown)
  end
end
