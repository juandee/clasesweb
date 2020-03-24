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
  #after_create :set_default_role

	def has_role?(role_sym)
  	roles.any? { |r| r.name.underscore.to_sym == role_sym }
	end

	def self.all_except(user)
    where.not(id: user)
  end

  def self.search(search)
    if search
      users = User.where('name LIKE :search OR surname LIKE :search OR email LIKE :search OR dni LIKE :search', search: "%#{search}%")
      if users 
        self.where('name LIKE :search OR surname LIKE :search OR email LIKE :search OR dni LIKE :search', search: "%#{search}%")
      else
        User.all
      end
    else
      User.all
    end
  end

  #private
  #def set_default_role
  #  assignment = Assignment.create(user_id: self.id, role_id: '3')
  #end
  	
end
