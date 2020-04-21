class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :assignments, :dependent => :destroy
	has_many :roles, :through => :assignments
  has_many :courses, :dependent => :destroy
  has_many :attendants, :dependent => :destroy
  has_many :classes, :through => :attendants, :source => "course" 
  validates :name, :surname, :dni, :birthday, presence: true
  validates :dni, numericality: { only_integer: true }, uniqueness: true
  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  paginates_per 5
  #after_create :set_default_role

  ransacker :dni do
    Arel.sql("CAST(#{table_name}.dni AS STRING)")
  end

	def has_role?(role_sym)
  	roles.any? { |r| r.name.underscore.to_sym == role_sym }
	end

	def self.all_except(user)
    where.not(id: user)
  end

  def self.students
    select { |u| u.has_role?(:student) }.sort_by { |u| u.surname }
  end

  def self.teachers
    select { |u| u.has_role?(:teacher) }.sort_by { |u| u.surname }
  end

  #private
  #def set_default_role
  #  assignment = Assignment.create(user_id: self.id, role_id: '3')
  #end
  	
end
