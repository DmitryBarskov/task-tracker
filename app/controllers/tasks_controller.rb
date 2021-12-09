class TasksController < ApplicationController
  before_action :authenticate_current_user!, except: %i[index]
  before_action :set_task, only: %i[show edit update destroy]
  before_action -> { authorize @task }, only: %i[show edit update destroy]

  def index
    authorize Task
    @tasks = Task.all

    respond_to do |format|
      format.html do
        render :index
      end
      format.json do
        render json: {tasks: @tasks.to_json}
      end
    end
  end

  def show
    @comments = Comment.where(task_id: @task.id)
    @comment = Comment.new
  end

  def new
    @task = Task.new
    authorize task
  end

  def create
    authorize Task, :create?

    @task = create_task.task
    if create_task.success?
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if update_task.task
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy!

    redirect_to tasks_path
  end

  private

  def create_task
    @create_task ||=
      CreateTask.call(task_params: task_params, current_user: current_user)
  end

  def update_task
    @update_task ||=
      UpdateTask.call(task_params: task_params, current_user: current_user, task_id: @task.id)
  end


  def set_task
    @task = Task.find_by!(id: params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :deadline_at).merge(user_id: current_user.id)
  end
end
