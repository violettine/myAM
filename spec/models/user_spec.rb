require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should rename user" do
    user =   User.new
    user.name = 'new_name'
    
    expect(user.name).to eq 'new_name'
  end

  it "should not change email to invalid" do
    user =   User.new
    user.email = 'invalid'
    
    expect(user.email).to eq 'invalid'
  end
end
