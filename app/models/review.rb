class Review < ApplicationRecord
	# model association
	belongs_to :user

	# validations
	validates_presence_of :rating
end
