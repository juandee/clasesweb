class Task < ApplicationRecord
	has_one_attached :video, :dependent => :destroy
	has_many_attached :documents, :dependent => :destroy
	belongs_to :course
	belongs_to :user
	has_many :questions, :dependent => :destroy
	validates :titulo, presence: true
	validates :descripcion, presence: true
  
  def new_question(text,user)
  	@question = self.questions.create(text: text, user_id: user.id)
  end

end