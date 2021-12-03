class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action -> { authorize @task }, only: %i[show edit update destroy]
  before_action -> { authorize Task }, only: %i[index new create]

  def index
    @tasks = Task.all
  end

  def show
    @comment = current_user.comments.new(task: @task)
  end

  def new
    @task = Task.new
  end

  def create
    @task = create_task.task

    if create_task.success?
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if update_task.success?
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    destroy_task
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def create_task
    @create_task ||=
      CreateTask.call(task_params: task_params, current_user: current_user)
  end

  def update_task
    @update_task ||=
      UpdateTask.call(task_params: task_params, task: @task)
  end

  def destroy_task
    @destroy_task ||=
      DestroyTask.call(task: @task)
  end
  
  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :deadline_at, :status)
  end
end
