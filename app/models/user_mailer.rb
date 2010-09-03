class UserMailer < ActionMailer::Base
  def birthday_notification(to_email, bdays)
    setup_email(to_email)
    @body[:bdays] = bdays    
  end

  protected

  def setup_email(user)    
    @recipients = "#{Trojans::EMAIL}"
    @from = "From <#{Trojans::FROM_EMAIL}>"
    @reply_to = "To <#{Trojans::FROM_EMAIL}>"
    @subject = "Happy Birthday"
    @sent_on = Time.now
    @body[:user] = user
  end  

end
