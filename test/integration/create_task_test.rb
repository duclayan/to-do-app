#1. User creates new task 
#2. User can update a current task 
#3. User can delete the current task

require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
    
    def setup
        # Assign fixture to task
        # We will use this for tests
    @task = tasks(:one)
    end

    test '01: User creates new task' do
        # 1.Check if new_task_path is working
        # 2. IF working => success : fail
        # 3. Check if successfully added (assert_difference)
        # 4. Create task with the input

        get new_task_path
        assert_response :success

        assert_difference 'Task.count', 1 do 
            post create_task_path, params: { task: {title: 'Create an Amazing API', description: 'Get started by searching in Google'}}
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '02: Update current task' do
        #1. @task holds fixture
        #2. Access Edit controller - should pass id parameter
        #3. Create changes - assert_changes
        #4. Access Update Method From Controller 
        
        @task = tasks(:one)
        get edit_task_path(:id => @task.id)
        assert_response :success

        assert_changes '@task.title' do
            put update_task_path(:id => @task.id), params: {task: {title: 'Create and Amazing API', description: 'Get started with an amazing API by searching'}}
            @task.reload
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '03: Delete task - task is done' do
        #Same as update
        
        @task = tasks(:one)
        get edit_task_path(:id => @task.id)
        assert_response :success

        assert_difference 'Task.count', -1 do 
            delete delete_task_path(:id => @task.id)
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

end