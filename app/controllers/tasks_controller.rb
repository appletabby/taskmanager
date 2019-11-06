class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :show , :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: "新增任務成功！"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "資料更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "任務刪除成功！"
  end

  private
  def task_params
    params.require(:task).permit(:content, :priority, :status, :started_at, :ended_at)
  end

  def find_task
    begin
      @task = Task.find(params[:id]) 
    rescue
    end
  end

end
