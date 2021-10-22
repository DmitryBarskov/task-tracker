class ProjectsController < ApplicationController
  before_action :authenticate_current_user!, except: %i[index]
  before_action :set_project, only: %i[show edit update destroy]
  before_action -> { authorize @project }, only: %i[show edit update destroy]

  # GET /projects
  def index
    authorize Project
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize @project
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    authorize Project, :create?

    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
          .merge(user_id: current_user.id)
  end
end
