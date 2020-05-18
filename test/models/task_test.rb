require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "task_should_have_title" do
  	@task = tasks(:actividad1)
  	@task.titulo = nil
  	assert_not @task.save
  end

  test "task_should_have_description" do
  	@task = tasks(:actividad1)
  	@task.descripcion = nil
  	assert_not @task.save
  end

  test "task_has_questions" do
  	@task = tasks(:actividad1)
  	assert @task.questions.any?
  	@task2 = tasks(:actividad8)
  	assert_not @task2.questions.any?
  end

  test "task_belongs_to_course" do
  	@course = courses(:curso_1)
  	assert @course.tasks.include? tasks(:actividad1)
  	assert_not @course.tasks.include? tasks(:actividad8)
  end
end
