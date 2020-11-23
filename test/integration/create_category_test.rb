require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

    def setup
        @category = categories(:one)
    end

    # test 'categories index' do
    #     get categories_path
    #     Category.assert_text(@category.name)
    # end

    test '01: Create a new category' do 
        get new_category_path
        assert_response :success
        
        assert_difference 'Category.count',1 do 
            post create_category_path, params: { category: {name: 'Sampletitle', description: 'This is a sample body text of an input'} }
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '02: Update a current category' do 

        get edit_category_path(:id => @category.id)
        assert_response :success

        assert_changes '@category.name' do
            put update_category_path(:id => @category.id),  params: { category: {name: 'Sampletitle2' } }
            @category.reload
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

    test '03: delete category' do
        get edit_category_path(:id => @category.id)
        assert_response :success

        assert_difference 'Category.count', -1 do
            delete delete_category_path(:id => @category.id)
            assert_response :redirect
        end

        follow_redirect!
        assert_response :success
    end

end