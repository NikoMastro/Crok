class PagesController < ApplicationController
  # Skip authentication for the landing page and features page
  skip_before_action :authenticate_user!, only: [:landing, :features]

  def home
    # @tasks = Task.all
    @tasks = Task.joins(:user).where(users: { family_id: current_user.family_id })
    @task = Task.new
    # @users = User.all
    @users = User.where(family: current_user.family)
    @comment = Comment.new
    @comments = Comment.all
    @dogs = current_user.family.dogs
    @first_day = first_day
    @last_day = last_day
    # @latest_health_track = HealthTrack.order(date: :desc).last
    @health_tracks = HealthTrack.all
  end

  def landing
    # No authentication required
  end

  def features
    # No authentication required
  end

  private

  def first_day
    today = Date.today
    Date.new(today.year, today.month, 1)
  end

  def last_day
    today = Date.today
    Date.new(today.year, today.month, -1)
  end
end
