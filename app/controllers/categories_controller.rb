class CategoriesController < ApplicationController
    
    def index
        @categories = Category.all
        @tasks = Task.all
        @users = User.all
    end

    def new 
        @category = Category.new
    end

    def create
        @user = User.find(params[:user_id])
        @category = @user.categories.new(category_params)

        if @category.save!
            redirect_to user_categories_path
        else 
            render :new
        end
    end

    def update
        @category = Category.find(params[:id])

        if @category.update(category_params)
            redirect_to user_categories_path
        else
            render :edit
        end
    end

    def show 
        @category = Category.find(params[:id])
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to user_categories_path
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name, :tags)
    end
end
