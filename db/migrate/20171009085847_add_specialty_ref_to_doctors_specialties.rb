class AddSpecialtyRefToDoctorsSpecialties < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors_specialties, :specialty, foreign_key: true
  end
end
