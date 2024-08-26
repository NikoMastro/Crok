class FamiliesController < ApplicationController
  def welcome
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to family_path
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
