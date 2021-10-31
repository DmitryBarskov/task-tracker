class TasksController < ApplicationController
  before_action :authenticate_current_user!, except: %i[index]
  before_action :set_task, only: %i[show edit update destroy]
  # before_action :authorize!, only: %i[edit update destroy]
  before_action -> {authorize @task}, only: %i[show edit update destroy]

  def index
    authorize Task
    @tasks = Task.all
  end

  def show
  end

  def edit
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    authorize Task, :create?
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Tasks was successfully destroyed.'
  end

  private
  
  def authorize!
    return if @task.user_id == current_user.id

    raise Authorization::AuthorizationError, "You are not allowed to manage this task action"
  end


  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :title, :description, :deadline_at)
          .merge(user_id: current_user.id)
  end
end
