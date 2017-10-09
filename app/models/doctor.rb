class Doctor < ApplicationRecord
	# model association
	has_many :reviews, counter_cache: true
	has_many :users, through: :reviews, dependent: :destroy

	has_many :doctors_specialties
	has_many :specialties, through: :doctors_specialties, dependent: :destroy
	
	# validations
	validates_presence_of :name, :address
	scope :visible, -> { where(visible: true) }

	# Scopes
	scope :recent,		->{ order("created_at DESC") }
	scope :active,		->{ where("reviews_count >= ?", 5)}
	scope :unanswered,	->{ where(reviews_count: 0)}
end
