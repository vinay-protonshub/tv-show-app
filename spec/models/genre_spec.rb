require 'rails_helper'

RSpec.describe Genre, type: :model do
  before(:all) do
    @genre = create(:genre)
  end

  it 'is valid with valid attributes' do
    expect(@genre).to be_valid
  end

  it 'has many shows' do
    should have_many(:shows).
    through(:show_genres)
  end
end
