require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get categories index" do
    get admin_categories_url
    assert_response :success
    assert response.body.include?("Categories list")
  end
end
