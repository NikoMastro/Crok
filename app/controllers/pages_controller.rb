class PagesController < ApplicationController
  # Skip authentication for the landing page and features page
  skip_before_action :authenticate_user!, only: [:landing, :features]

  def home
    @tasks = Task.all
    @task = Task.new
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all
  end

  def landing
    # No authentication required
  end

  def features
    # No authentication required
  end
end
