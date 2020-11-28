require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def setup
    get tasks_url
  end

  test 'should get new' do 
      get new_task_url
      assert_response :success
  end

  test 'should create' do
      post create_task_path, params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input'} }
      assert_response :redirect

      follow_redirect!
      assert_response :success
  end

  test 'should update' do
      put update_task_path(:id => categories(:one)), params: { task: {title: 'Sampletitle', description: 'This is a sample body text of an input'} }
      assert_equal 'Sampletitle', assigns(:task).title
  end

  test 'should show' do
      show_task_path(:id => 2)
      assert_response :success
  end

  test 'should get delete' do 
      delete_task_path(:id => 2)
      assert_response :success
  end
end
