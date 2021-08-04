require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:competition_entries) }
    it { should have_many(:competitions).through(:competition_entries) }
  end

  describe 'class methods' do
    describe '.sort_by_average_age' do
      it 'returns all the teams ordered by the average age of their players from highest to lowest' do
        team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
        team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')
        team_3 = Team.create!(hometown: 'Newcastle', nickname: 'The Magpies')

        player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: team_1.id)
        player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: team_1.id)
        player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: team_2.id)
        player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: team_2.id)
        player_5 = Player.create!(name: "Callum Wilson", age: 30, team_id: team_3.id)
        player_6 = Player.create!(name: "Ezze Alwafai", age: 35, team_id: team_3.id)

        expect(Team.sort_by_average_age).to eq([team_3, team_1, team_2])
      end
    end
  end
end
