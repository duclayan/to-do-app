require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

    def setup
        @one = categories :one
        @two = categories :two
    end

    test 'should go to new form and create article' do 
     get '/categories/new'
     assert_response :success
     
     post create_category_path, params: { category: {name: 'Sampletitle', description: 'This is a sample body text of an input'} }
     assert_response :redirect

     follow_redirect!
     assert_response :success
    end

end