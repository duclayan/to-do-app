require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'Dom')
  end
  
  #Happy-path
  test "valid category name" do
    assert @category.valid?
  end

  test "invalid without name" do

      @category.name = nil

      refute @category.valid?,'saved user without a name'
      assert_not_nil @category.errors[:name], 'no validation error: name present'
  end
end
