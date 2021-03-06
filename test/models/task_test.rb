require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @category = categories(:one)
    @user = users(:one)
    @task = Task.new( title: 'Sample One', description: 'This is a sample description', category_id: @category.id, user_id: @user.id)

  end
  
  #Happy-path
  test "01: Valid task title" do
    assert @task.valid?
  end

  test "02: invalid without name" do

      @task.title = nil

      refute @task.valid?,'saved empty task'
      assert_not_nil @task.errors[:name], 'no validation error: task present'
  end

  test '03: invalid without description' do
    @task.description = nil
    refute @task.valid?, 'saved task without a description'
    # assert_not_nil @task.errors[:description]
  end

end
