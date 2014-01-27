class StepsController < ApplicationController
  # before_action :load_task

  def index
    @task = Task.find(params[:task_id])
    # @steps = Step.find(params[:id])
    # @tasksteps = task_steps_path(@task)
  end

  def new
    @task = Task.find(params[:task_id])
    @step = @task.steps.new
  end

  def create
    @task = Task.find(params[:task_id])
    @step = @task.steps.new(step_params)
    if @step.save
      flash[:success] = "Step added!"
      redirect_to task_path(@task)
    else
      flash[:error] = "Uh oh, step not added"
      render 'new'
    end
  end

  def show
    @step = Step.find(params[:id])
  end

  def edit
  end

def destroy
  @step = Step.find(params[:id]).destroy
  redirect_to task_path
end

  private


  def load_task
    @task = Task.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:title, :note, :task_id)
  end

end
