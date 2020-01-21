require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end

  it { should have_many(:watchlists) }

  it { should have_many(:listings) }

  it 'should have many shows' do
    should have_many(:shows).
      through(:listings)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it { should have_secure_password }

  it { should validate_presence_of(:email)}

  it { should validate_presence_of(:username)}

  it "has a unique email" do
    user2 = build(:user, email: @user1.email)
    expect(user2).to_not be_valid
  end
end
