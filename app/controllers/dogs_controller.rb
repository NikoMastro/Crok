class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
    @tasks = Task.all
    @new_task = Task.new
  end
end
