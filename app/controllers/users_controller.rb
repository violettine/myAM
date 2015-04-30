class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @messages = @user.messages
  end
end
