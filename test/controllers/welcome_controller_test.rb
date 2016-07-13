require 'test_helper'

class MainControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | " + app_name
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | " + app_name
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | " + app_name
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
    assert_select "title", "Dashboard | " + app_name
  end
end
