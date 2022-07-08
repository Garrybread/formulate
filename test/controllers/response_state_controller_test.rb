require "test_helper"

class ResponseStateControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get response_state_create_url
    assert_response :success
  end
end
