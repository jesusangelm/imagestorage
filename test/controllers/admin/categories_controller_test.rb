require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categories = categories()
    @existed_category = categories(:one)
  end

  test "should get categories index" do
    get admin_categories_url
    assert_response :success
    assert response.body.include?("Categories List")
    assert response.body.include?(@categories.first.name)
    assert response.body.include?(@categories.first.desc)
  end

  test "should show new category form" do
    get new_admin_category_url
    assert_response :success
    assert response.body.include?("New Category Form")
  end

  test "should create a category" do
    assert_difference("Category.count") do
      post admin_categories_url, params: { category: { name: "categoria 1", desc: "desc categoria 1" } }
    end

    assert_redirected_to admin_categories_path
  end

  test "should show edit category form" do
    get edit_admin_category_url(@existed_category)
    assert_response :success
    assert response.body.include?("Edit Category Form")
    assert response.body.include?(@existed_category.name)
    assert response.body.include?(@existed_category.desc)
  end

  test "should update a category" do
    patch admin_category_url(@existed_category), params: {
                                category: {
                                  name: "categoria 1 actualizada",
                                  desc: "modificada categoria 1"
                                }
    }

    assert_redirected_to admin_categories_path
  end
end
