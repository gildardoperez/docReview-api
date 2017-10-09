class Doctor < ApplicationRecord
	# model association
	has_many :reviews
	has_many :users, through: :reviews, dependent: :destroy

	has_many :doctors_specialties
	has_many :specialties, through: :doctors_specialties, dependent: :destroy
	
	# validations
	validates_presence_of :name, :address
	scope :visible, -> { where(visible: true) }
end
