require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:mufie)
    @other_user = users(:nala)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'someone@somewhere.com', name: 'someone', password: 'password', password_confirmation: 'password' }
    end

    assert_redirected_to root_url
    #assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    log_in_as(@user)
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    log_in_as(@user)
    patch :update, id: @user, user: { email: @user.email, name: @user.name }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
