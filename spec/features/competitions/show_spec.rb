require 'rails_helper'

RSpec.describe 'Competition Show page' do
  before :each do
    @competition_1 = Competition.create!(name: 'Champions League', location: 'Italy', sport: 'Soccer')
    @competition_2 = Competition.create!(name: 'Europa League', location: 'Germany', sport: 'Soccer')

    @team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
    @team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')
    @team_3 = Team.create!(hometown: 'Newcastle', nickname: 'The Magpies')

    CompetitionEntry.create!(team: @team_1, competition: @competition_1)
    CompetitionEntry.create!(team: @team_2, competition: @competition_1)
    CompetitionEntry.create!(team: @team_2, competition: @competition_2)
    CompetitionEntry.create!(team: @team_3, competition: @competition_2)

    @player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: @team_1.id)
    @player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: @team_1.id)
    @player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: @team_2.id)
    @player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: @team_2.id)
    @player_5 = Player.create!(name: "Callum Wilson", age: 30, team_id: @team_3.id)

    visit "/competitions/#{@competition_1.id}"
  end

  it 'displays the competition name, location, and sport' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content("Location: #{@competition_1.location}")
    expect(page).to have_content("Sport: #{@competition_1.sport}")
    expect(page).to_not have_content(@competition_2.name)
  end

  it 'displays the nickname and hometown of all teams in the competition' do
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_1.hometown)

    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_2.hometown)

    expect(page).to_not have_content(@team_3.nickname)
    expect(page).to_not have_content(@team_3.hometown)
  end

  it 'displays the avgerage age across all players in the competition' do
    expect(page).to have_content("Average player age: #{@competition_1.average_player_age}")
  end

  it 'displays a link to add a team to the competition' do
    expect(page).to have_link('Register a new team')

    click_link 'Register a new team'

    expect(current_path).to eq("/competitions/#{@competition_1.id}/competition_entries/new")
  end
end
