class HealthTracksController < ApplicationController

  def index
    @health_tracks = HealthTrack.all
  end

  def show
    @health_track = HealthTrack.find(params[:dog_id])
  end

  def new
    @health_track = HealthTrack.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @health_track = HealthTrack.new(track_params)
    @health_track.dog = Dog.find(params[:dog_id])
    if @health_track.save
      redirect_to :dog_health
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
      redirect_to :dog_health
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @health_track = HealthTrack.find(params[:id])
    @health_track.destroy!
    redirect_to :dog_health
  end

  private

  def track_params
    params.require(:health_track).permit(:weight, :height, :bcs, :exercise, :date)
  end

end
