require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without name" do
  	@user = users(:pepe)
  	@user.name = nil
  	assert_not @user.save
  end

  test "should not save user without surname" do
  	@user = users(:pepe)
  	@user.surname = nil
  	assert_not @user.save
  end

  test "should not save user withou dni" do
  	@user = users(:pepe)
  	@user.dni = nil
  	assert_not @user.save
  end

  test "dni should be integer" do
  	@user = users(:pepe)
  	@user.dni = 'pepe'
  	assert_not @user.save
  end

  test "should not save user without birthdate" do 
  	@user = users(:pepe)
  	@user.birthday = nil
  	assert_not @user.save
  end

  test "user roles" do
  	assert users(:pepe).has_role?(:teacher)
  	assert_not users(:pepe).has_role?(:student)
  	assert users(:martina).has_role?(:student)
  	assert_not users(:martina).has_role?(:teacher)
  end
  
  test "user_dni_should_be_unique" do
    @user = users(:pepe)
    @user.dni = users(:martina).dni
    assert_not @user.save
  end
end