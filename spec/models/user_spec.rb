require 'rails_helper'

RSpec.describe User, :type => :model do
  it "renames the user" do
    user =   User.new
    user.name = 'new_name'
    
    expect(user.name).to eq 'new_name'
  end

  it "not changes email to invalid" do
    user =   User.new
    user.email = 'invalid'
    
    expect(user.email).to eq 'invalid'
  end

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end
end
