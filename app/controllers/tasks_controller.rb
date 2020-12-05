class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def set_task
    @task = Task.find(params[:id])
  end

  def index
    @task = Task.all
  end

  def new 
    @task = Task.new(task_params)
  end

  def create
      @task = Task.new(task_params)

      if @task.save!
          redirect_to category_tasks_path
      else 
          render :new
      end
  end

  def update
      @task = Task.find(params[:id])

      if @task.update(task_params)
          redirect_to categories_path
      else
          render :edit
      end
  end

  def show 
      @task = Task.find(params[:id])
  end

  def destroy
      @task = Task.find(params[:id])
      @task.delete
      redirect_to categories_path
  end

  def edit
      @task = Task.find(params[:id])
  end

  private

  def task_params
      params.require(:task).permit(:title, :description, :category_id)
  end
end
