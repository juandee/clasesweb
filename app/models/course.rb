class Course < ApplicationRecord
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :pupils, class_name: "User", foreign_key: "user_id"
	has_many :tasks, dependent: :destroy

	def set_owner(user)
		self.owner = user
	end

	def set_pupils
		self.pupils = []
	end
end
