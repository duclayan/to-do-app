require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

    def setup
        @category = categories(:one)
        @user = users(:one)
        @sample_keys = {user_id: @user.id,  id: @category.id}
    end

    test '01: Create a new category' do 
        get new_user_category_path(@user.id)
        assert_response :success
        
        assert_difference 'Category.count',1 do 
            post user_categories_path(@user.id), params: { category: {name: 'Sampletitle'} }
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '02: Update a current category' do 
        @category = categories(:one)
        get edit_user_category_path(@sample_keys)
        assert_response :success

        assert_changes '@category.name' do
            put user_category_path(@sample_keys),  params: { category: {name: 'Sampletitle2' } }
            @category.reload
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '03: delete category' do
        @category = categories(:one)

        get edit_user_category_path(@sample_keys)
        assert_response :success

        assert_difference 'Category.count', -1 do
            delete user_category_path(@sample_keys)
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

end