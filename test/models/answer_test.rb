require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "answer_should_have_text" do
  	@answer = answers(:a_one)
  	@answer.text = nil
  	assert_not @answer.save
  end

  test "answer_belongs_to_question" do
  	@question = questions(:one)
  	assert @question.answer == answers(:a_one)
  	assert_not @question.answer == answers(:a_two)
  end

  test "answer_belongs_to_user" do
  	@user = users(:pepe)
  	assert @user.answers.include? answers(:a_one)
  	assert @user.answers.include? answers(:a_two)
  end
end
