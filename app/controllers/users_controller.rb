class UsersController < ApplicationController
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
end
