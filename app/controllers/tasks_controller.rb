class TasksController < ApplicationController
  before_action :set_course
  before_action :set_user
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @course.tasks.new(task_params)
    @task.user_id = @user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to user_course_task_path(@user,@course,@task), notice: 'Se creó correctamente la actividad.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_course_task_path(@user,@course,@task), notice: 'La actividad se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_course_path(@user,@course), notice: 'Se eliminó correctamente la actividad.' }
      format.json { head :no_content }
    end
  end

  def makequestion
    @task = Task.find(params[:task_id])
    @question = @task.new_question(params[:text_question],@user)
    if @question.save
      respond_to do |format|
        format.html { redirect_to user_course_task_path(@user,@course,@task), notice: 'Ya se generó tu consulta.' }
        format.json { render :task, status: :ok, location: @task }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:titulo, :descripcion, :user_id, :course_id, :video, documents: [])
    end
end