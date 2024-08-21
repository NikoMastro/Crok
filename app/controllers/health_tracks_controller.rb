class HealthTracksController < ApplicationController

  def index
    @health_tracks = HealthTrack.all
  end

  def show
    @health_track = HealthTrack.find(params[:id])
  end

  def new
    @health_track = HealthTrack.new
  end

  def create
    @health_track = HealthTrack.new(track_params)
    @health_track.dog = Dog.find(params[:dog_id])
    if @health_track.save
      redirect_to :dog_health(Dog.find(params[:dog_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @health_track = HealthTrack.find(params[:id])
  end

  def update
    @health_track = HealthTrack.find(params[:id])
    if @health_track.update(track_params)
      redirect_to :dog_health(Dog.find(params[:dog_id]))
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @health_track = HealthTrack.find(params[:id])
    @health_track.destroy!
    redirect_to :dog_health(Dog.find(params[:dog_id]))
  end

  def dog_score
    @track = HealthTrack.find(params[:id])
    ratio_score = @track.weight / @track.height / @track.ideal_w2h_ratio
    # find age factor
    @dog = Dog.find(params[:id])
    age = Date.today - @dog.birthdate
    age_score = 0
    avg_age = (@track.life_expectancies[1] + @track.life_expectancies[1]) / 2
    # if dog is older than max life expectancy
    if age > @track.life_expectancies[1]
      age_score = 1
      #if dog is younger than min life expectancy
    elsif age < @track.life_expectancies[0]
      age_score = 10 - (age / avg_age * 5)
    else
      age_score = 10 - (age / avg_age * 9)
    end

    (@track.bcs * 0.4 + ratio_score * 0.2 + @track.exercise * 0.2 + age_score * 0.2).round
  end

  private

  def track_params
    params.require(:health_track).permit(:weight, :height, :bcs, :date)
  end

end
