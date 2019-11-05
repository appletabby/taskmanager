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
      redirect_to tasks_path, notice: "新增任務成功！"
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])  
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "資料更新成功！"
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:content, :priority, :status, :started_at, :ended_at)
  end

end
