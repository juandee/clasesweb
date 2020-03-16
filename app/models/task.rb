class Task < ApplicationRecord
	has_one_attached :video
	has_many_attached :documents
	belongs_to :course
	belongs_to :user
end