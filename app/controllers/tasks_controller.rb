class TasksController < ApplicationController
	before_action :set_task, only: [:show, :destroy]
	def index
		@tasks = Task.all
	end	

	def show
	end	


	def destroy 
		@task.destroy!
		redirect_to tasks_path
	end	

	private

	def set_task
		@task = Task.find_by!(id: params[:id])
	end	
end
