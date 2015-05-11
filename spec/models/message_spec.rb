require 'rails_helper'

RSpec.describe Message, :type => :model do
  it "is valid with content" do
    expect(FactoryGirl.create(:message)).to be_valid
  end

  it "is invalid without content" do
    expect(FactoryGirl.build(:message, content: nil)).to_not be_valid
  end

  it "is invalid without user_id" do
    expect(FactoryGirl.build(:message, user_id: nil)).to_not be_valid
  end
end
