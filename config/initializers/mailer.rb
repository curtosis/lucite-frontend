ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = :true

if Rails.env.development?
	smtp_server = 'smtp.gmail.com'
	domain = 'heroku.com'
	user_name = 'blutokyo@gmail.com'
	password = 'dqudghemuqehjhtr'
else
	smtp_server = 'smtp.sendgrid.net'
	domain = 'heroku.com'
	user_name = ENV['SENDGRID_USERNAME']
	password = ENV['SENDGRID_PASSWORD']
end

ActionMailer::Base.smtp_settings = {
  :address => smtp_server, 
  :port => 587,
  :domain => domain,
  :user_name => user_name,
  :password => password,
  :authentication => 'plain',
}
