require "test_helper"

class Admin::MerchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_merches_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_merches_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_merches_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_merches_edit_url
    assert_response :success
  end
end
