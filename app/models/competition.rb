class Competition < ApplicationRecord
  has_many :competition_entries
  has_many :teams, through: :competition_entries

  def average_player_age
    teams
    .joins(:players)
    .select('players.*')
    .average(:age).to_f
  end
end
