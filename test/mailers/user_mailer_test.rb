require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:mufie)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Activate Your Account!", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@userauth.com"], mail.from
    assert_match "Hi", mail.body.encoded
    assert_match user.name,               mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
end
