class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      redirect_to projects_path, notice: "You've succesfully signed up!"
    else
      render :new
    end
  end


  private

  def users_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
