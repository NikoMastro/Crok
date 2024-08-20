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
      redirect_to health_track_path(@health_track)
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
      redirect_to health_track_path(@health_track)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @health_track = HealthTrack.find(params[:id])
    @health_track.destroy!
    redirect_to dog_path(Dog.find(params[:dog_id]))
  end

  private

  def dog_score
    @track = HealthTrack.find(params[:id])
    ratio = @track.weight / @track.height
    # find ideal w/h ratio
    # find energy score and age factor
    # (@track.bcs * 0.4 + (ratio / ideal_ratio * 0.2) + energy_score * 0.2 + age_factor * 0.2).round
  end

  def track_params
    params.require(:health_track).permit(:weight, :height, :bcs, :date)
  end

end
