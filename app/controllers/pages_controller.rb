class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @tasks = Task.all
    @task = Task.new
    @users = User.all
    @comment = Comment.new
    @comments = Comment.all

  end

  def landing
  end
end
