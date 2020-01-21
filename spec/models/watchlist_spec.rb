require 'rails_helper'

RSpec.describe Watchlist, type: :model do
  before(:all) do
    @watchlist1 = create(:watchlist)
  end

  it 'is valid with valid attributes' do
    expect(@watchlist1).to be_valid
  end

  it { is_expected.to belong_to :user }

  it 'should have many shows' do
    should have_many(:shows).
      through(:listings)
  end

  it { should validate_presence_of(:name) }
end
