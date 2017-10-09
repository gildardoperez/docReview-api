class Review < ApplicationRecord
	# model association
	belongs_to :doctor

	# validations
	validates_presence_of :rating
end
