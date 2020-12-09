require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = categories(:one)
    @task = tasks(:one)
    @user = users(:one)
    @sample_keys = {category_id: @category.id, user_id: @user.id, id: @task.id}
    @sample_params =  {params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input', category_id: @category.id, user_id: @user.id}}}
    get user_category_task_url(@sample_keys)
    sign_in users(:one)

    

  end

  test '01: should get new' do 
    get new_user_category_task_path, **@sample_params
    assert_response :success
  end

  test '02: should create' do
      post user_category_tasks_path(@sample_keys), **@sample_params
      assert_response :redirect

      follow_redirect!
      assert_response :success
  end

  test '03: should update' do
      put user_category_task_path(@sample_keys), **@sample_params
      assert_equal 'Sampletitle', assigns(:task).title
  end

  test '04: should show' do
      get user_category_task_path(@sample_keys)
      assert_response :success

  end

  test '05: should get delete' do 
      delete user_category_task_path(@sample_keys)

      follow_redirect!
      assert_response :success
  end
end
