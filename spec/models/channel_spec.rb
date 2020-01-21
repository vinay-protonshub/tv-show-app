require 'rails_helper'

RSpec.describe Genre, type: :model do
  before(:all) do
    @channel = create(:channel)
  end

  it 'is valid with valid attributes' do
    expect(@channel).to be_valid
  end

  it 'has many shows' do
    should have_many(:shows)
  end
end
