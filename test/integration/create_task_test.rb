#1. User creates new task 
#2. User can update a current task 
#3. User can delete the current task

#NOTES: 
#When creating the set up always use '@'
require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
    
    def setup

    @task = tasks(:one)
    @category = categories(:one)
    @sample_keys = {category_id: @category.id ,id: @task.id}
    @sample_params = {params: {task: {title: 'Create and Amazing API', description: 'Get started with an amazing API by searching', category_id: @category.id}}}
    @category_id = {:category_id => @category.id}

    end

    test '01: User creates new task' do

        get new_category_task_path(@category_id),  @sample_params
        assert_response :success

        assert_difference 'Task.count', 1 do 
            post category_tasks_path(@category_id), @sample_params
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '02: Update current task' do
        @task = tasks(:one)
        get edit_category_task_path(@sample_keys)
        assert_response :success

        assert_changes '@task.title' do
            patch category_task_path(@category_id), @sample_params
            @task.reload
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '03: Delete task - task is done' do
        get edit_category_task_path(@sample_keys)

        assert_response :success

        assert_difference 'Task.count', -1 do 
            delete category_task_path(@sample_keys)
            assert_response :redirect
        end
        follow_redirect!
        assert_response :success
    end

end