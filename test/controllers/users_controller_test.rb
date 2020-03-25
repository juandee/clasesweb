require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test "should get index" do
    sign_in users(:admin)
    get users_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:admin)
    get new_user_url
    assert_response :success
  end

  #test "should create user" do
  #  sign_in users(:admin)
  #  assert_difference('User.count') do
  #    post users_url, params: { user: { birthday: @user.birthday, dni: @user.dni, name: @user.name, surname: @user.surname, email: @user.email, encrypted_password: @user.encrypted_password } }
  #  end

  #  assert_redirected_to user_url(User.last)
  #end

  test "should show user" do
    sign_in users(:admin)
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in users(:admin)
    patch user_url(@user), params: { user: { birthday: @user.birthday, dni: @user.dni, name: @user.name, surname: @user.surname } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    sign_in users(:admin)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
