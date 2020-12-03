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
        post categories_path, params: { category: {name: 'Sampletitle'} }
        assert_response :redirect

        follow_redirect!
        assert_response :success
    end

    test 'should update' do
        put category_path(:id => categories(:one)), params: { category: {name: 'Sampletitle'} }
        assert_equal 'Sampletitle', assigns(:category).name
    end

    test 'should show' do
        category_path(:id => 2)
        assert_response :success
    end

    test 'should get delete' do 
        category_path(:id => 2)
        assert_response :success
    end
end