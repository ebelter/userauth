require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:mufie)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Activate Your Account", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@" + Rails.application.secrets.action_mailer_host_name], mail.from
    assert_match "Hi", mail.body.encoded
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test "password_reset" do
    user = users(:mufie)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "Reset Your Password", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@" + Rails.application.secrets.action_mailer_host_name], mail.from
    assert_match user.reset_token,        mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
end
