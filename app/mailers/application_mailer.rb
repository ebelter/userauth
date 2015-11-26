class ApplicationMailer < ActionMailer::Base
  helper :application
  default from: "noreply@" + Rails.application.secrets.action_mailer_host_name
  layout 'mailer'
end
