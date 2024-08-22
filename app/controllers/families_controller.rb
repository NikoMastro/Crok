class FamiliesController < ApplicationController

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.family = @family
      current_user.save
      redirect_to home_path
    else
      render 'welcome', status: :unprocessable_entity
    end
  end

  def welcome
    if current_user.family
      1
    else
      @family = Family.new
    end
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to home_path
    else
      render 'welcome', status: :unprocessable_entity
    end
  end

  def show
    @family = Family.find(params[:id])
  end


  private

  def family_params
    params.require(:family).permit(:name)
  end
end
