require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = categories(:one)
    get category_tasks_path(@category)
  end

  test 'should get new' do 
    @task =  tasks(:two)
    @category = categories(:two)
    get new_category_task_path(@category)
      assert_response :success
  end

  test 'should create' do
      post category_tasks_path, params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input', category_id: @category.id} }
      assert_response :redirect

      follow_redirect!
      assert_response :success
  end

  test 'should update' do
      put category_task_path(:id => categories(:one)), params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input'} }
      assert_equal 'Sampletitle', assigns(:task).title
  end

  test 'should show' do
      category_task_path(:id => 2)
      assert_response :success
  end

  test 'should get delete' do 
    @task =  tasks(:one)
    # assert_difference('Task.count', -1, 'A Task should be destroyed') do
    #     delete :destroy 
    # end
        @category = categories(:one)
    #   category_task_path(category_id: @category.id, id: @task.id)
      delete category_task_path(@category,@task)

      follow_redirect!
      assert_response :success
  end
end
