class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy, :edit, :update]
  before_action -> { authorize @task }, only: %i[show edit update destroy]

  def index
    authorize Task
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    authorize @task
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task has been updated'
    else
      render :edit
    end
  end

  def create
    authorize Task, :create?
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: 'Task has been created!'
    else
      render :new
    end
  end

  def destroy
    authorize @task
    @task.destroy!

    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :deadline_at)
  end
end
