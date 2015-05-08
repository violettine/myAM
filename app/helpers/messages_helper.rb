module MessagesHelper

  def personal_address
    current_user.name? ? current_user.name : current_user.email
  end

  def timestamp_for_messages(message)
    if message.created_at > Time.now - 1.hour
      time_ago_in_words(message.created_at) +' ago'
    else
      message.created_at.strftime("on %m/%d/%Y at %I:%M%p ")
    end
  end
end
