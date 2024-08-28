class DogsController < ApplicationController
  def index
    @tasks = Task.joins(:user).where(users: { family_id: current_user.family_id })
    @task = Task.new
    @users = User.where(family: current_user.family)
    @comment = Comment.new
    @comments = Comment.all
    @dogs = current_user.family.dogs
    @first_day = first_day
    @last_day = last_day
    @health_tracks = HealthTrack.all
  end

  def show
    @dog = Dog.find(params[:id])
    @tasks = Task.where(dog: @dog)
    @task = Task.new
    @first_day = first_day
    @last_day = last_day
    @health_tracks = HealthTrack.where(dog: @dog).order(date: :desc)
    @medical_records = @dog.medical_records
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
    @dog.tasks.destroy_all # Delete associated tasks before deleting the dog
    @dog.destroy
    redirect_to family_path(@dog.family), status: :see_other
  end

  def health
    @dog = Dog.find(params[:id])
    @health_track = HealthTrack.new
    @health_tracks = HealthTrack.where(dog: @dog).order(date: :desc)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthdate, :sex, :allergies, photos: [])
  end

  def first_day
    today = Date.today
    Date.new(today.year, today.month, 1)
  end

  def last_day
    today = Date.today
    Date.new(today.year, today.month, -1)
  end
end
