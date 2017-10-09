class Doctor < ApplicationRecord
	# model association
	has_many :reviews, dependent: :destroy

	# validations
	validates_presence_of :name, :address
	scope :visible, -> { where(visible: true) }
end
