class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_user
 
  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result.order(:name).page params[:page]
    if params[:q].blank?
      @courses = Course.all.order(:name).page params[:page]
    end
  end

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
    @q = @course.pupils.ransack(params[:q])
    @p = @q.result.sort_by { |p| p.surname }
    @pupils = Kaminari.paginate_array(@p).page(params[:page]).per(5)
    if params[:q].blank?
      @p = @course.pupils.sort_by { |p| p.surname }
      @pupils = Kaminari.paginate_array(@p).page(params[:page]).per(5)
      if @pupils.empty?
        flash.now[:alert] = "Aún no hay alumnos inscriptos a este curso."
      else
        @pupils
      end
    end
  end

  def addpupils
    @course = Course.find(params[:course_id])
    @q = User.ransack(params[:q])
    if params[:q].blank?
      @p = @course.not_signedup
      @pupils = Kaminari.paginate_array(@p).page(params[:page]).per(5)
      if @pupils.empty?
        flash.now[:alert] = "No hay alumnos disponibles para agregar al curso."
      else
        @pupils
      end
    else
      @p = @q.result
      @result = @course.check_condition(@p)
      @pupils = Kaminari.paginate_array(@result).page(params[:page]).per(5)
    end
  end

  def updatepupils
    @course = Course.find(params[:course_id])
    if params[:selected_pupils].blank?
      respond_to do |format|
        format.html { redirect_to user_course_addpupils_path(@user,@course), alert: "No seleccionaste ningún alumno." }
        format.json { render :pupils, status: :ok, location: @course }
      end
    else
      @course.add_pupils(params[:selected_pupils])
      respond_to do |format|
        format.html { redirect_to user_course_pupils_path(@user,@course), notice: 'Se agregaron correctamente los alumnos al curso' }
        format.json { render :pupils, status: :ok, location: @course }
      end   
    end
  end

  def deletepupils
    @course = Course.find(params[:course_id])
    if params[:selected_pupils].blank?
      respond_to do |format|
        format.html { redirect_to user_course_pupils_path(@user,@course), alert: "No seleccionaste ningún alumno." }
        format.json { render :pupils, status: :ok, location: @course }
      end
    else
      @course.delete_pupils(params[:selected_pupils])
      respond_to do |format|
        format.html { redirect_to user_course_pupils_path(@user,@course), notice: 'Se eliminaron correctamente los alumnos del curso' }
        format.json { render :pupils, status: :ok, location: @course }
      end    
    end
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