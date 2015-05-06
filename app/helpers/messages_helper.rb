module MessagesHelper

  def personal_address
    unless current_user.name.blank?
      address = current_user.name
    else 
      address = current_user.email
    end
  end
end
