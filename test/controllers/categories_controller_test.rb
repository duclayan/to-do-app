require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    def setup
        get categories_url
    end

    test 'should get new' do 
        get new_category_url
        assert_response :success
    end

    test 'should create' do
        create_category_url(:name => 'Sampletitle', :description => 'This is a sample body text of an input')
        assert_response :success
    end

    test 'should update' do
        update_category_path(:id => 2)
        assert_response :success

    end

    test 'should show' do
        show_category_path(:id => 2)
        assert_response :success
    end

    test 'should get delete' do 
        delete_category_path(:id => 2)
        assert_response :success
    end
end