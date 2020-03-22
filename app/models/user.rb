class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assignments
	has_many :roles, :through => :assignments
  has_many :courses
  has_many :attendants
  has_many :classes, class_name: "Course", :through => :attendants 
  validates :name, :surname, :dni, :birthday, presence: true
  validates :dni, numericality: { only_integer: true }

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
        @message = "Ningún resultado coincide con la búsqueda."
      end
    else
      User.all
    end
  end
  	
end
