class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def pupils
    @course = Course.find(params[:course_id])
    @pupils = @course.pupils
  end

  def addpupils
    @course = Course.find(params[:course_id])
    all = User.all
    all.each do |p|
      if p.has_role?(:student)
        @pupils.add(p)
      end
    end
    if @pupils.nil?
      flash.now[:alert] = "No hay alumnos disponibles para agregar al curso."
    else
      @pupils
    end
  end

  def add_pupil(pupil)
    @course.pupils.add(pupil)
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = @user.courses.new(course_params)
    @course.set_owner(@user)
    respond_to do |format|
      if @course.save
        format.html { redirect_to user_course_path(@user,@course), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to user_course_path(@user,@course), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to user_courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :descripcion, :user_id)
    end
end
