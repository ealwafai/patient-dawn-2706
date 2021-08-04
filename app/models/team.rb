class Team < ApplicationRecord
  has_many :players
  has_many :competition_entries
  has_many :competitions, through: :competition_entries

  def self.sort_by_average_age
    joins(:players)
    .select('teams.*, avg(players.age) as average_age')
    .group(:id)
    .order('average_age desc')
  end
end
