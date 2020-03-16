class Course < ApplicationRecord
	belongs_to :user
	has_many :users
	has_many :tasks
end
