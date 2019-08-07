require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get destroy" do
    get logout_url
    assert_redirected_to root_url
  end

end
