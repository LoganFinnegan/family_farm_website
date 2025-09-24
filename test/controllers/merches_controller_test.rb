require "test_helper"

class MerchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get merches_index_url
    assert_response :success
  end

  test "should get show" do
    get merches_show_url
    assert_response :success
  end
end
