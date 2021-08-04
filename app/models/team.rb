class Team < ApplicationRecord
  has_many :players
  has_many :competition_entries
  has_many :competitions, through: :competition_entries
end
