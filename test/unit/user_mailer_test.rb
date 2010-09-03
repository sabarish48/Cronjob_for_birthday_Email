require File.dirname(__FILE__) + '/../test_helper'

class UserMailerTest < ActionMailer::TestCase
 
  def test_birthday_notification
    users(:sabarish).update_attribute(:date_of_birth, Time.new.strftime("1989-#{Time.now.month}-#{Time.now.day}"))
    UserMailer.deliver_birthday_notification(Trojans::EMAIL, [users(:sabarish)])
    bday_email = ActionMailer::Base.deliveries.last
    assert_match(/Happy Birthday/, bday_email.subject)
    assert_match(/Wishing Many more happy returns of the day to/, bday_email.body)
    assert_match(/Have a Successful year ahead/, bday_email.body)
  end

end
