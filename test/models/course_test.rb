require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "course_should_have_name" do
  	@course = courses(:curso_1)
  	@course.name = nil
  	assert_not @course.save
  end

  test "course_should_have_description" do
  	@course = courses(:curso_1)
  	@course.descripcion = nil
  	assert_not @course.save
  end

  test "course_should_belong_to_user" do
  	@course = courses(:curso_1)
  	assert @course.owner == users(:pepe)
  	assert_not @course.owner == users(:martina)
  end

  test "course_should_have_owner" do
  	@course = courses(:curso_1)
  	@course.owner = nil
  	assert_not @course.save
  end

  test "course_has_pupils" do
  	@course = courses(:curso_1)
  	assert @course.pupils.any?
  	@count_pupils = @course.pupils.count
  	assert @count_pupils == 3
  	assert_not @count_pupils == 2
  	@course2 = courses(:curso_2)
  	assert_not @course2.pupils.any?
  end

  test "course_has_taks" do
  	@course = courses(:curso_1)
  	assert @course.tasks.any?
  	@course2 = courses(:curso_5)
  	assert_not @course2.tasks.any?
  end

  test "task_belongs_to_course" do
  	@course = courses(:curso_1)
  	assert @course.tasks.include?(tasks(:actividad1))
  	assert @course.tasks.include?(tasks(:actividad2))
  	assert_not @course.tasks.include?(tasks(:actividad3))
  end

  test "pupil_belongs_to_course" do
  	@course = courses(:curso_1)
  	assert @course.pupils.include?(users(:martina))
  	assert @course.pupils.include?(users(:abril))
  end
end