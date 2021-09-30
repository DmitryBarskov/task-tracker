class TasksController < ApplicationController

	before_action :set_task, only: [:show, :destroy]
	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		task = Task.new(task_params)

		if task.save
			redirect_to task_path(task), notice: 'Task has ben created'
		else
			render :new
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

	def task_params
		params.permit(:project_id, :title, :description, :deadline_at)
	end	
end

