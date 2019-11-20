class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: I18n.t('controller.create.notice')
    else
      render :new
    end
  end

  def edit
  end

  def show
    @task = Task.find_by(id: params[:id]) 
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: I18n.t('controller.update.notice')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: I18n.t('controller.destroy.notice')
  end

  private
  def task_params
    params.require(:task).permit(:content, :priority, :status, :started_at, :ended_at)
  end

  def find_task
    @task = Task.find(params[:id]) 
  end

end
