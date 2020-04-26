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

	def not_signedup
	  all = User.all
      @pupils = []
      all.each do |p|
       if p.has_role?(:student) && !self.pupils.include?(p)
         @pupils << p
       end
      end
      @pupils.sort_by { |p| p.surname }
	end

	def check_condition(result)
	  @pupils = []
	  result.each do |p|
	    if p.has_role?(:student) && !self.pupils.include?(p)
          @pupils << p
        end
	  end
	  @pupils.sort_by { |p| p.surname }
	end
end
