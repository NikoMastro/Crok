class PagesController < ApplicationController
  # Skip authentication for the landing page and features page
  skip_before_action :authenticate_user!, only: [:landing, :features]

  def home
    @tasks = Task.all
    @task = Task.new
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all
    @dogs = Dog.all
    @first_day = first_day
    @last_day = last_day
    @latest_health_track = HealthTrack.order(date: :desc).first
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
