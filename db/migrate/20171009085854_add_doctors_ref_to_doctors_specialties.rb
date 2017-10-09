class AddDoctorsRefToDoctorsSpecialties < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors_specialties, :doctor, foreign_key: true
  end
end
