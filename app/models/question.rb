class Question < ApplicationRecord
	belongs_to :user
	belongs_to :task
	has_one :answer, :dependent => :destroy
	validates :text, presence: true
  
  def new_answer(text,user)
  	self.answer = Answer.create(text: text, user_id: user.id)
  	@answer = self.answer
  end

end