module MessagesHelper

  def personal_address
    current_user.name? ? current_user.name : current_user.email
  end
end
