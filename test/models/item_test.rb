require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @existing_category = categories(:one) # Reference to fixture
    @item_one = items(:one)
  end

  # name presence
  test "invalid when name is blank" do
    item = Item.new(name: "", category: @existing_category)
    assert_not item.valid?
    assert_includes item.errors[:name], "can't be blank"
  end

  test "valid with non-blank name" do
    item = Item.new(name: "New item", category: @existing_category)
    assert item.valid?
  end


  # category presence
  test "invalid with no category" do
    item = Item.new(name: "without category")
    assert_not item.valid?
    assert_includes item.errors[:category], "must exist"
  end

  test "valid with a category" do
    item = Item.new(name: "with category", category: @existing_category)
    assert item.valid?
  end

  # image attachment
  test "item have a valid image" do
    image = @item_one.image
    assert image.attached?
    assert_not_nil image.download
    assert_equal "imagen_prueba.png", image.filename.to_s
  end

  test "image micro variant is 160x160" do
    micro = @item_one.image.variant(:micro).processed
    image_micro = MiniMagick::Image.read(micro.download)

    assert_equal 160, image_micro.width
    assert_equal 160, image_micro.height
  end

  test "image mini variant is 350x350" do
    mini = @item_one.image.variant(:mini).processed
    image_mini = MiniMagick::Image.read(mini.download)

    assert_equal 350, image_mini.width
    assert_equal 350, image_mini.height
  end
end
