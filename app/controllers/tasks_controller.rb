class TasksController < ApplicationController
#   before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @task = Task.all
  end

  def new 
      @task = Task.new
  end

  def create
      @task = Task.new(task_params)

      if @task.save!
          redirect_to tasks_path
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

  def delete
      @task = Task.find(params[:id])
      @task.delete
      redirect_to categories_path
  end

  def edit
      @task = Task.find(params[:id])
  end

  private

  def task_params
      params.require(:task).permit(:title, :description)
  end
end
