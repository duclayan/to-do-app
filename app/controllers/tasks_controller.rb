class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :new]
  skip_before_action :verify_authenticity_token

  # def authenticate_user!(opts={})
  #   opts[:scope] = :user
  #   warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
  # end

  def index
    if params[:deadline]
      @task = Task.where(:deadline => Date.today)
    else
      @task = Task.all
    end
  end

  def new 
      @task = Task.new
      @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def create
    @user = User.find(params[:user_id])
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new(task_params)
    # @user = User.find(params[:user_id])
    @category.tasks << @task
    @user.tasks << @task
    
      if @user.save && @task.save!
          redirect_to user_category_tasks_path
      else 
          render :new
      end
  end

  def update
      @task = Task.find(params[:id])

      if @task.update(task_params)
          redirect_to user_categories_path
      else
          render :edit
      end
  end

  def show 
    @task = Task.find(params[:id])

    # if Category.find(params[:id])
    #   @task = Task.find(params[:id])
    # else
    #   @task.destroy
    # end

  end
  # end

  def destroy
      @task = Task.find(params[:id])
      @task.delete
      redirect_to user_category_tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
      params.require(:task).permit(:id, :title, :description, :category_id, :deadline, :iscomplete, :user_id, :show_all)
  end

end
