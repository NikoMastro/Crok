class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @tasks = Task.where(dog: @dog)
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.family = current_user.family
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy!
    redirect_to dogs_path
  end

  def health
    @dog = Dog.find(params[:id])
    @health_tracks = HealthTrack.where(dog: @dog)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthdate, :sex, :allergies, photos: [])
  end

end
