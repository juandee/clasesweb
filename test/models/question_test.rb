require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "question_should_have_text" do
  	@question = questions(:one)
  	@question.text = nil
  	assert_not @question.save
  end

  test "question_belongs_to_user" do
  	@user = users(:martina)
  	assert @user.questions.include? questions(:one)
  	assert @user.questions.include? questions(:four)
  	assert_not @user.questions.include? questions(:two)
  end

  test "question_belongs_to_task" do
  	@task = tasks(:actividad1)
  	assert @task.questions.include? questions(:one)
  	assert @task.questions.include? questions(:two)
  	assert_not @task.questions.include? questions(:three)
  end

  test "question_has_answer" do
  	@question = questions(:one)
  	assert @question.answer.present?
  	@question = questions(:two)
  	assert @question.answer.present?
  	@question3 = questions(:three)
  	assert_not @question3.answer.present?
  end
end