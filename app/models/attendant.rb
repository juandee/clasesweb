class Attendant < ApplicationRecord
	belongs_to :pupil, class_name: "User"
	belongs_to :course
end
