class UsersController < ApplicationController
  before_action :set_current_user, only: [:create]

  def create
    @user = User.new(user_params)
    @user.family = @current_user.family

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, alert: 'There was an error creating the user.'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def remove_family
    @user = User.find(params[:id])
    family = @user.family
    @user.family = nil
    @user.save
    redirect_to family_path(family)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_current_user
    @current_user = current_user
  end
end
