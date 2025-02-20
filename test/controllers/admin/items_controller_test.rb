require "test_helper"

class Admin::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items = items()
    @existed_item = items(:one)
  end

  test "should get items index" do
    get admin_items_url
    assert_response :success
    assert response.body.include?("Items List")
    assert response.body.include?(@items.first.name)
    assert response.body.include?(@items.first.desc)
    assert response.body.include?(@items.first.category.name)
  end

  test "should show new item form" do
    get new_admin_item_url
    assert_response :success
    assert response.body.include?("New Item Form")
  end

  test "should create a item" do
    assert_difference("Item.count") do
      post admin_items_url, params: { item: { name: " new item 1", desc: "desc item 1", category_id: categories(:one).id } }
    end

    assert_redirected_to admin_items_path
  end

  test "should show edit item form" do
    get edit_admin_item_url(@existed_item)
    assert_response :success
    assert response.body.include?("Edit Item Form")
    assert response.body.include?(@existed_item.name)
    assert response.body.include?(@existed_item.category.name)
    assert response.body.include?(@existed_item.desc)
  end

  test "should update a item" do
    patch admin_item_url(@existed_item), params: {
                                item: {
                                  name: "item 1 actualizada",
                                  desc: "modificada item 1"
                                }
    }

    assert_redirected_to admin_items_path
  end

  test "should destroy a item" do
    @delete_me = items(:two)
    assert_difference("Item.count", -1) do
      delete admin_item_url(@delete_me)
    end

    assert_redirected_to admin_items_path
  end
end
