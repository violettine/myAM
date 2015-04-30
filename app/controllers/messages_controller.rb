class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @message = current_user.messages.build
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

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
