require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "anonymous user should get redirected to login" do
    get main_index_url
    assert_redirected_to login_url
  end

  test "unverified user should get redirected to verify" do
    post sessions_url, params: { username: 'UnverifiedUser', password: 'secret' }
    assert_redirected_to verify_url
  end

  test "verified user should get index" do
    post sessions_url, params: { username: 'VerifiedUser', password: 'secret' }
    assert_redirected_to root_url
    get main_index_url
    assert_response :success
  end

end
