class Question < ApplicationRecord
	belongs_to :user
	belongs_to :task
	has_one :answer, :dependent => :destroy
	validates :text, presence: true
end