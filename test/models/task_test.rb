require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    
    @task = Task.new(title: 'Make Manakeesh', description: 'You have to prepare the ingredients before creating this goodie', category_id: @)
  end
  
  #Happy-path
  test "Valid task title" do
    @task = Task.new(title: 'Make Manakeesh', description: 'You have to prepare the ingredients before creating this goodie')

    assert @task.valid?
  end

  test "invalid without name" do

      @task.title = nil

      refute @task.valid?,'saved empty task'
      assert_not_nil @task.errors[:name], 'no validation error: task present'
  end

  test 'invalid without description' do
    @task.description = nil
    refute @task.valid?, 'saved task without a description'
    # assert_not_nil @task.errors[:description]
  end

end
