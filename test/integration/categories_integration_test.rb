require "test_helper"

class CategoriesIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    login_as(@user)
    @category = categories(:one)
  end

  test "should createa new category" do
    get new_admin_category_url
    assert_response :success

    assert_difference("Category.count") do
      post admin_categories_url, params: {
        category: { name: "nueva categoria", desc: "categoria de prueba" }
      }
    end

    assert_redirected_to admin_categories_path
    follow_redirect!

    assert_response :success
    assert_select "div.name", "nueva categoria"
  end

  test "should edit a existed category" do
    get edit_admin_category_path(@category)
    assert_response :success

    patch admin_category_path(@category), params: {
      category: {
        name: "categoria actualizada"
      }
    }

    assert_redirected_to admin_categories_path
    follow_redirect!

    assert_response :success
    assert_select "div.name", "categoria actualizada"

    @category.reload
    assert_equal "categoria actualizada", @category.name
  end

  test "should delete a existed category" do
    assert_difference("Category.count", -1) do
      delete admin_category_path(@category)
    end

    assert_redirected_to admin_categories_path
    follow_redirect!

    assert_response :success
  end
end
