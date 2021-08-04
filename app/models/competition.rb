class Competition < ApplicationRecord
  has_many :competition_entries
  has_many :teams, through: :competition_entries
end
