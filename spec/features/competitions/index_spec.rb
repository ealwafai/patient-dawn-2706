require 'rails_helper'

RSpec.describe 'Competition Index' do
  before :each do
    @competition_1 = Competition.create!(name: 'Champions League', location: 'Italy', sport: 'Soccer')
    @competition_2 = Competition.create!(name: 'Europa League', location: 'Germany', sport: 'Soccer')
    @competition_3 = Competition.create!(name: 'Premier League', location: 'UK', sport: 'Soccer')

    visit "/competitions"
  end

  it 'displays the names of all competitions' do
    expect(page).to have_content("All Competitions")
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
  end

  it 'links to each competition show page' do
    click_link 'Champions League'

    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end
end
