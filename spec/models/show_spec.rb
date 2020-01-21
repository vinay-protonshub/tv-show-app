require 'rails_helper'

RSpec.describe Show, type: :model do
  before(:all) do
    @show1 = create(:show)
    @user1 = create(:user)
    Listing.create(     show: @show1,
                        user: @user1,
                        user_season: 1)
  end

  it 'is valid with valid attributes' do
    expect(@show1).to be_valid
  end

  it { is_expected.to belong_to :channel }

  it 'has many users' do
    should have_many(:users).
    through (:listings)
  end

  it { should validate_presence_of(:title) }

  it 'validates that the title and channel are unique' do
    channel1 = create(:channel)
    show1 = create(:show, title: "Westworld", channel: channel1)
    show2 = build(:show, title: "Westworld", channel: channel1)
    expect(show2).to_not be_valid
  end

  it { should validate_presence_of(:current_season) }

  it 'is not valid if the season is not a number' do
    show2 = build(:show, current_season: "Fred")
    expect(show2).to_not be_valid
  end
end
