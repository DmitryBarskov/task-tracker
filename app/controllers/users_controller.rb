class UsersController < ApplicationController

  def show
    authorize User, :create?
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    authorize User, :create?
    @user = User.new(users_params)

    if @user.save
      redirect_to projects_path, notice: "You've successfully signed up!"
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end






