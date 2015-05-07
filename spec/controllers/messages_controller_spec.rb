require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  describe "POST #create" do
    context 'when message save is a success' do
      it "flashes success" do
        user = User.create!(name:  "test person",
                            email: "bla@bla.com",
                            password:              "password",
                            password_confirmation: "password")
        sign_in user
        message = user.messages.build

        post :create, message: {content: 'test', author: 'test_user'}
        
        expect(flash[:success]).to match(/^Message created!/)
      end

      it "redirects to root_url" do
        user = User.create!(name:  "test person",
                            email: "bla@bla.com",
                            password:              "password",
                            password_confirmation: "password")
        sign_in user
        message = user.messages.build

        post :create, message: {content: 'test', author: 'test_user'}
        
        expect(response).to redirect_to root_url
      end
    end
  end
end
