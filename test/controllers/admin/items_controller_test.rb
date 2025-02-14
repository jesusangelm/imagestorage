require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items = items()
  end

  test "should get items index" do
    get admin_items_url
    assert_response :success
    assert response.body.include?("Items List")
    assert response.body.include?(@items.first.name)
    assert response.body.include?(@items.first.desc)
    assert response.body.include?(@items.first.category.name)
  end
end
