require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:one)
        @category = categories(:one)
        @sample_keys = {user_id: @user.id, id: @category.id}
        get user_categories_url(:user_id => @user.id)

    end

    test 'should get new' do 
        get new_user_category_url
        assert_response :success
    end

    test 'should create' do
        post user_categories_path(@sample_keys), params: { category: {name: 'Sampletitle'} }
        assert_response :redirect

        follow_redirect!
        assert_response :success
    end

    test 'should update' do
        put user_category_path(@sample_keys), params: { category: {name: 'Sampletitle'} }
        assert_equal 'Sampletitle', assigns(:category).name
    end

    test 'should show' do
        user_category_path(:id => 2)
        assert_response :success
    end

    test 'should get delete' do 
        user_category_path(:id => 2)
        assert_response :success
    end
end