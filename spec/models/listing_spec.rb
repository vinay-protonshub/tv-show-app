require 'rails_helper'

RSpec.describe Listing, type: :model do
  before(:all) do
    @listing1 = create(:listing)
  end

  it 'is valid with valid attributes' do
    expect(@listing1).to be_valid
  end

  it { is_expected.to belong_to :watchlist }

  it { is_expected.to belong_to :show }

  it { is_expected.to belong_to :user }

  it 'is not valid if the season is not a number' do
    listing2 = build(:listing, user_season: "Fred")
    expect(listing2).to_not be_valid
  end

  it 'is not valid if the user\'s season is ahead of current season' do
    show = create(:show, current_season: 3)
    listing2 = build(:listing, show: show, user_season: 5)
    expect(listing2).to_not be_valid
  end
end
