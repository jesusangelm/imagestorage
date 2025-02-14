require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get items index" do
    get admin_items_url
    assert_response :success
    assert response.body.include?("Items list")
  end
end
