require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | UserAuth"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | UserAuth"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | UserAuth"
  end
end
