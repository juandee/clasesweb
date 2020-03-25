require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:actividad1)
    @user = users(:pepe)
    @course = courses(:curso_1)
  end

  test "should get index" do
    sign_in users(:pepe)
    get user_course_tasks_url(@user,@course)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:pepe)
    get new_user_course_task_path(@user,@course)
    assert_response :success
  end

  test "should create task" do
    sign_in users(:pepe)
    assert_difference('Task.count') do
      post user_course_tasks_url(@user,@course), params: { task: { descripcion: @task.descripcion, titulo: @task.titulo } }
    end

    assert_redirected_to user_course_task_url(@user,@course,Task.last)
  end

  #test "should show task" do
  #  sign_in users(:pepe)
  #  get user_course_task_path(@user,@course,@task)
  #  assert_response :success
  #end

  test "should get edit" do
    sign_in users(:pepe)
    get edit_user_course_task_path(@user,@course,@task)
    assert_response :success
  end

  test "should update task" do
    sign_in users(:pepe)
    patch user_course_task_url(@user,@course,@task), params: { task: { descripcion: @task.descripcion, titulo: @task.titulo } }
    assert_redirected_to user_course_task_path(@user,@course,@task)
  end

  test "should destroy task" do
    sign_in users(:pepe)
    assert_difference('Task.count', -1) do
      delete user_course_task_url(@user,@course,@task)
    end

    assert_redirected_to user_course_url(@user,@course)
  end
end
