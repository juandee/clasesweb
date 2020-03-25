require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:curso_1)
    @user = users(:pepe)
  end

  test "should get index" do
    sign_in users(:pepe)
    get user_courses_url(@user)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:pepe)
    get new_user_course_url(@user)
    assert_response :success
  end

  test "should create course" do
    sign_in users(:pepe)
    assert_difference('Course.count') do
      post user_courses_url(@user), params: { course: { descripcion: @course.descripcion, name: @course.name } }
    end

    assert_redirected_to user_course_url(@user,Course.last)
  end

  test "should show course" do
    sign_in users(:pepe)
    get user_course_url(@user,@course)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:pepe)
    get edit_user_course_url(@user,@course)
    assert_response :success
  end

  test "should update course" do
    sign_in users(:pepe)
    patch user_course_url(@user,@course), params: { course: { descripcion: @course.descripcion, name: @course.name } }
    assert_redirected_to user_course_url(@user,@course)
  end

  test "should destroy course" do
    sign_in users(:pepe)
    assert_difference('Course.count', -1) do
      delete user_course_url(@user,@course)
    end

    assert_redirected_to user_courses_url(@user)
  end
end
