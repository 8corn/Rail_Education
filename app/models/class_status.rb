class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list
	
	def self.exceeds_capacity?(class_list_id)
	  current_size = where(class_list_id: class_list_id).size
	  max_capacity = ClassList.find(class_list_id).c_account
	  current_size >= max_capacity
  end
	
  def self.applied?(user_id, class_list_id)
	  exists?(user_id: user_id, class_list_id: class_list_id)
  end
	
  def self.total_credits(user_id)
	  joins(:class_list).where(user_id: user_id).sum(:credits)
  end
	  
end
