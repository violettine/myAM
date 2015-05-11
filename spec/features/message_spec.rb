require 'rails_helper'

describe 'Messages', :type => :feature do 
  describe 'New Message' do
    let!(:user) {create :user}
    it "adds a new message" do
      
      visit new_user_session_path
      fill_in 'user_email', with:user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'
      
      visit new_message_path
      expect{
        fill_in 'message_recipient', with: 'testing content'
        fill_in 'message_content', with: 'testing content'
        fill_in 'message_author', with: 'test author'
        click_button 'Post' 
        #save_and_open_page
      }.to change(Message, :count).by(1)
    end
  end  
end

#create a before :each to login the user first!
