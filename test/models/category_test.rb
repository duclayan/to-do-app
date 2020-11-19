require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save card without name' do
      category = Category.new
      assert_not category.save
  end
end
