class ClassList < ApplicationRecord
	has_many :class_statuses
	has_many :users, :through => :class_statuses
end
