class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_task
  before_action :set_user
  before_action :set_course

  def new
    @question = Question.new
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to user_course_task_url(@user,@course,@task), notice: 'Se eliminó tu consulta.' }
      format.json { head :no_content }
    end
  end

  def answerquestion
    @question = Question.find(params[:question_id])
    @answer = @question.new_answer(params[:answer],@user)
    if @answer.save
      respond_to do |format|
        format.html { redirect_to user_course_task_path(@user,@course,@task), notice: 'Se guardó tu respuesta.' }
        format.json { render :task, status: :ok, location: @task }
      end
    end
  end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def set_user
      @user = current_user
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:answer)
    end

end