class TasksController < ApplicationController

  def index
     @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "New task added - get to work!"
      redirect_to @task
    else
      render 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
    # task_path
  end

  def edit
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :difficulty)
  end
end





