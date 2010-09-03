require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase

  def test_should_trigger_birthday_notification
    users(:sabarish).update_attribute(:date_of_birth, Time.new.strftime("1989-#{Time.now.month}-#{Time.now.day}"))    
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      User.send_birthday_notification
    end
    bday_email = ActionMailer::Base.deliveries[-1]  
    assert_match(/Wishing Many more happy returns of the day to/, bday_email.body)
    assert_match(/Regards/, bday_email.body)
    assert_match(/Trojans/, bday_email.body)
  end
end
