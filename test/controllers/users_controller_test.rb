require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    UsersController.stub_any_instance :start_verification, true do
      assert_difference('User.count') do
        post users_url, params: { user: { password: 'secret', password_confirmation: 'secret', displayed_phone_number: 'phonenumber', phone_number: '+phonenumber', username: 'test', channel: 'sms' } }
      end
    end

    assert_redirected_to verify_url
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
