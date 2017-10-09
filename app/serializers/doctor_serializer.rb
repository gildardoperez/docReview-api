class DoctorSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :doctor_id, :group_id, :name, :image, :address, :latitude, :longitude, :created_at, :updated_at
  # model association
  has_many :reviews
  has_many :doctors_specialties
  has_many :specialties
end
