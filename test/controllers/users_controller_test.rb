require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_portflolio" do
    get users_my_portflolio_url
    assert_response :success
  end
end
