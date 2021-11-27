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

    @project = create_project.project
    if create_project.success?
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if update_project.success?
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

  def create_project
    @create_project ||=
      CreateProject.call(project_params: project_params, current_user: current_user)
  end

  def update_project
    @update_project ||=
      UpdateProject.call(project_params: project_params, current_user: current_user, project: @project)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, user_ids: [])
  end
end
