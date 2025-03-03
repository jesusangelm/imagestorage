require "test_helper"

class ItemsIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @item = items(:one)
  end

  test "should create a new item with image" do
    get new_admin_item_path
    assert_response :success

    image = fixture_file_upload("imagen_prueba.png", "image/png")

    assert_difference("Item.count") do
      post admin_items_url, params: {
        item: {
          name: "nuevo item",
          category_id: @category.id,
          image: image
        }
      }
    end

    assert_redirected_to admin_items_path
    follow_redirect!

    assert_response :success
    assert_select "div.name", "nuevo item"

    item = Item.last
    assert item.image.attached?
  end

  test "should edit a existed item" do
    get edit_admin_item_path(@item)
    assert_response :success

    patch admin_item_path(@item), params: {
      item: {
        name: "item actualizado"
      }
    }

    assert_redirected_to admin_items_path
    follow_redirect!

    assert_response :success
    assert_select "div.name", "item actualizado"

    @item.reload
    assert_equal "item actualizado", @item.name
  end

  test "should delete a existed item" do
    assert_difference("Item.count", -1) do
      delete admin_item_path(@item)
    end

    assert_redirected_to admin_items_path
    follow_redirect!

    assert_response :success
  end
end
