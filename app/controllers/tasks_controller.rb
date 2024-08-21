class TasksController < ApplicationController
  # before_action :set_task, only: [:edit, :update, :destroy]

  def create
    @task = Task.new(task_params)
    @task.status = false
    @task.dog = Dog.find(13)
    @task.user = current_user
    if @task.save
      redirect_to root_path
    else
      # raise
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def update
    @task.update(task_params)
    @task.status = false
    if @task.save
      redirect_to root
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :location, :start_time, :end_time, :user_id)
  end
end
