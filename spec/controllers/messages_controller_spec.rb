require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  describe "POST #create" do
    let!(:user) { create(:user) }

    context 'when message save is a success' do
      it "flashes success" do
        sign_in user

        post :create, message: {content: 'test', author: 'test_user'}
        
        expect(flash[:success]).to match(/^Message created!/)
      end

      it "redirects to root_url" do
        sign_in user

        post :create, message: {content: 'test', author: 'test_user'}
        
        expect(response).to redirect_to root_url
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:user) { create(:user) }
    let!(:message) { create(:message) }

    context "when message destroy is a success" do
      it "flashes success" do
        sign_in user
        
        delete :destroy, id: message.id
        
        expect(flash[:success]).to match(/^Message deleted!/)
      end

      it "redirects to message path" do
        sign_in user

        delete :destroy, id: message.id

        expect(response).to redirect_to message_path
      end
    end
    context "when message to destroy is nil" do
      it "redirects to root_path" do
        sign_in user

        delete :destroy, id: {message: nil}

        expect(response).to redirect_to root_path
      end
    end
  end
end
