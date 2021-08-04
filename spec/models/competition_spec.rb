require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_entries) }
    it { should have_many(:teams).through(:competition_entries) }
  end
end
