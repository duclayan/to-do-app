require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = categories(:one)
    @task = tasks(:one)
    @sample_params =  {params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input', category_id: @category.id} }}
    get category_tasks_url(@category)
  end

  test '01: should get new' do 
    get new_category_task_path, @sample_params
    assert_response :success
  end

  test '02: should create' do
      post category_tasks_path, @sample_params
      assert_response :redirect

      follow_redirect!
      assert_response :success
  end

  test '03: should update' do
      put category_task_path(:id => categories(:one)), @sample_params
      assert_equal 'Sampletitle', assigns(:task).title
  end

  test '04: should show' do
      category_task_path(:id => 2)
      assert_response :success
  end

  test '05: should get delete' do 
      delete category_task_path(@category,@task)

      follow_redirect!
      assert_response :success
  end
end
