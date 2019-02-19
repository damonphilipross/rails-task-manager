class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    # By default rails will render a view at the end of each action.
    # The view rendered has the same name as the action
    # The view is located in a folder with the same name as the controller
  end

  def show
  end

  def new           # GET /restaurants/new
    @task = Task.new
  end

  def create        # POST /restaurants
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    # @task = Task.find(params[:id])
    @task.save
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
