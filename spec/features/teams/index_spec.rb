require 'rails_helper'

RSpec.describe 'team index' do
  before :each do
    @team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
    @team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')
    @team_3 = Team.create!(hometown: 'Newcastle', nickname: 'The Magpies')

    @player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: @team_1.id)
    @player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: @team_1.id)
    @player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: @team_2.id)
    @player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: @team_2.id)
    @player_5 = Player.create!(name: "Callum Wilson", age: 30, team_id: @team_3.id)
    @player_6 = Player.create!(name: "Ezze Alwafai", age: 35, team_id: @team_3.id)

    visit "/teams"
  end

  it 'displays the nicknames of all teams' do
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
  end

  it 'displays the average age of each team players' do
    within "div#team-#{@team_1.id}" do
      expect(page).to have_content('Average player age: 25.5')
    end
    within "div#team-#{@team_2.id}" do
      expect(page).to have_content('Average player age: 25')
    end
    within "div#team-#{@team_3.id}" do
      expect(page).to have_content('Average player age: 32.5')
    end

    expect(@team_3.nickname).to appear_before(@team_1.nickname)
    expect(@team_1.nickname).to appear_before(@team_2.nickname)
  end
end
