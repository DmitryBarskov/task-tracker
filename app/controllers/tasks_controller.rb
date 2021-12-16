class TasksController < ApplicationController
  before_action :authenticate_current_user!, except: %i[index]
  before_action -> { authorize @task }, only: %i[show edit update destroy]
  before_action :set_task, only: %i[show edit update destroy]
  
  def index
    authorize Task
    @tasks = Task.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(task: @task).order(created_at: :desc)
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    authorize Task, :create?

    @task = create_task.task
    if create_task.success?
      redirect_to @task, notice: 'Task has been created!'
    else
      render :new
    end
  end

  def edit; 
  end

  def update
    if update_task.success?
      redirect_to @task, notice: 'The task has been updated!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def create_task
    @create_task ||= CreateTask.call(task_params: task_params,
                                     current_user: current_user)
  end

  def update_task
    @update_task ||= UpdateTask.call(task_params: task_params, 
                                     task: @task,
                                     current_user: current_user)
  end

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :deadline_at, :status)
  end

end