class CategoriesController < ApplicationController

    def index
        @category = Category.all

    end

    def new 
        @category = Category.new
    end

    def create
        @category = Category.new(article_params)

        if @category.save!
            redirect_to categories_path
        else 
            render :new
        end
    end

    def update
        @category = Category.find(params[:id])

        if @category.update(article_params)
            redirect_to categories_path
        else
            render :edit
        end
    
    end

    def show 
        @category = Category.find(params[:id])
    end

    def delete
        @category = Category.find(params[:id])
        @category.delete
        redirect_to categories_path
    end

    def edit
        @category = Category.find(params[:id])
    end
    
    private
    
    def article_params
        params.require(:category).permit(:name, :description, :tags)
    end
end
