require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @existing = categories(:one) # Reference to fixture
  end

  # name presence
  test "invalid when name is blank" do
    category = Category.new(name: "")
    assert_not category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end

  test "valid with non-blank name" do
    category = Category.new(name: "New Category")
    assert category.valid?
  end

  # name uniqueness
  test "invalid with duplicate name" do
    new_category = Category.new(name: @existing.name)
    assert_not new_category.valid?
    assert_includes new_category.errors[:name], "has already been taken"
  end

  test "invalid with duplicate name case-insensitive" do
    new_category = Category.new(name: @existing.name.upcase)
    assert_not new_category.valid?
  end
end
