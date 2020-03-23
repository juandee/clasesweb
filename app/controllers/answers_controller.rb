class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_question
  before_action :set_task
  before_action :set_user
  before_action :set_course

  def new
  	@answer = Answer.new
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to user_course_task_url(@user,@course,@task), notice: 'Se eliminó tu respuesta.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
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
    def answer_params
      params.require(:answer).permit(:text)
    end

end