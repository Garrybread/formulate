require "test_helper"

class MyFormsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_forms_index_url
    assert_response :success
  end
end
