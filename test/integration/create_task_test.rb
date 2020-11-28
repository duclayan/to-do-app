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
        # 1.Check if new_category_path is working
        # 2. IF working => success : fail
        # 3. Check if successfully added (assert_difference)
        # 4. Create task with the input

        get new_task_path
        assert_response :success

        assert_difference 'Task.count', 1 do 
            post create_task_path, params: { task: {title: 'Create an Amazing API', description: 'Get started by searching in Google'}}
            assert_response :success
        end

    end
end