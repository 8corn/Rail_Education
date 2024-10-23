class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
	has_many :class_statuses
	has_many :class_lists, :through => :class_statuses
	
	def current_credits
		ClassStatus.where(user_id: id).joins(:class_list).sum(:credits) || 0
	end
	
	def can_add_credits?(new_credits)
		(current_credits + new_credits) <= max_credits
	end
end
