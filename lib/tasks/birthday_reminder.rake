namespace :user do
  namespace :birthday_notification do
    desc "Send notifications on the birthdays of the list"
    task :send => :environment do
      User.send_birthday_notification
    end
  end
end