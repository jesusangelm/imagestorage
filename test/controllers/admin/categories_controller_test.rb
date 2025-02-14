require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories = categories()
  end

  test "should get categories index" do
    get admin_categories_url
    assert_response :success
    assert response.body.include?("Categories List")
    assert response.body.include?(@categories.first.name)
    assert response.body.include?(@categories.first.desc)
  end
end
