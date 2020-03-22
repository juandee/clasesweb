class Course < ApplicationRecord
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :attendants
	has_many :pupils, :through => :attendants, :source => "user"
	has_many :tasks, dependent: :destroy

	def set_owner(user)
		self.owner = user
	end

end
