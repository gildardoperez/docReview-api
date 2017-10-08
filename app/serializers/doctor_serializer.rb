class DoctorSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :doctor_id, :group_id, :name, :image, :address, :latitude, :longitude, :created_at, :updated_at
  # model association
  has_many :reviews
end
