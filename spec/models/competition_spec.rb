require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_entries) }
    it { should have_many(:teams).through(:competition_entries) }
  end

  describe 'instance methods' do
    describe '#average_player_age' do
      it 'returns the average age across all players' do
        competition = Competition.create!(name: 'Champions League', location: 'Italy', sport: 'Soccer')

        team_1 = Team.create!(hometown: 'Manchester', nickname: 'The Red Devils')
        team_2 = Team.create!(hometown: 'London', nickname: 'The Blues')

        CompetitionEntry.create!(team: team_1, competition: competition)
        CompetitionEntry.create!(team: team_2, competition: competition)

        player_1 = Player.create!(name: "Marcus Rashford", age: 25, team_id: team_1.id)
        player_2 = Player.create!(name: "Bruno Fernandez", age: 26, team_id: team_1.id)
        player_3 = Player.create!(name: "Christian Pulisic", age: 22, team_id: team_2.id)
        player_4 = Player.create!(name: "Mason Mount", age: 28, team_id: team_2.id)

        expect(competition.average_player_age).to eq(25.25)
      end
    end
  end
end
