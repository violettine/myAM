require 'rails_helper'

RSpec.describe MessagesController, :type => :controller do
  describe "Get #show" do
    let!(:user) { create(:user) }

    context "when user is not logged in" do
      it "does not show messages" do
        get :show, id: user.id

        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "Get #new" do
    let!(:user) { create(:user) }

    context "when user is not logged in" do
      it "will not create new message" do
        get :new

        expect(response).to redirect_to new_user_session_path
      end
    end
  end

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

      it "creates a new message" do
        sign_in user

        expect{post :create, message: attributes_for(:message)}.to change(Message, :count).by(1) 
      end
    end

    context "when message save is no success" do
      it "renders to pages/home" do
        sign_in user

        post :create, message: attributes_for(:invalid_message)

        expect(response).to render_template("pages/home")
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
