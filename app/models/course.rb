class Course < ApplicationRecord
	belongs_to :owner, class_name: "User", foreign_key: "user_id"
	has_many :attendants, :dependent => :destroy
	has_many :pupils, :through => :attendants, :source => "user"
	has_many :tasks, :dependent => :destroy
	validates :name, presence: true
	validates :descripcion, presence: true
	paginates_per 5

	def set_owner(user)
	  self.owner = user
	end

	def enroled(users)
	  @pupils = []
	  users.each do |u|
	  	if u.has_role?(:student) && !self.pupils.include?(u)
         @pupils << u
        end
      end
      @pupils.sort_by { |p| p.surname }
	end

	def not_signedup
	  all = User.all
      @pupils = self.enroled(all)
	end

	def check_condition(result)
	  @pupils = self.enroled(result)
	end

	def add_pupils(pupils)
	  pupils.each do |p| self.pupils << User.where(id: p) end
	end

	def delete_pupils(pupils)
	  pupils.each do |p| self.pupils.delete(p) end
	end
end
