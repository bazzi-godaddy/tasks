class TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def show
    render json: Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: task
    else
      render json: task.errors.full_messages
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      render json: task
    else
      render json: task.errors.full_messages
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    render json: { message: 'Task deleted' }
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :due_date)
    end
end
