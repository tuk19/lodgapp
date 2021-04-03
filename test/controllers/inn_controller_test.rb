require "test_helper"

class InnControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inn_index_url
    assert_response :success
  end
end
