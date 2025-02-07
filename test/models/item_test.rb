require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @existing_category = categories(:one) # Reference to fixture
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
end
