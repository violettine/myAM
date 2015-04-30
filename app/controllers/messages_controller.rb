class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @message = current_user.messages.build
  end

  def show
    @messages = current_user.messages
  end
  
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = 'Message created!'
      redirect_to root_url
    else
      render 'pages/home'
    end
  end

  def destroy
    @message.destroy
    flash[:success] = 'Message deleted!'
    redirect_to message_path
  end

  private

    def message_params
      params.require(:message).permit(:content, :picture)
    end

    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_url if @message.nil?
    end
end
