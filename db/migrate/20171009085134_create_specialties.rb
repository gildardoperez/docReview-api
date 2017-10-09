class CreateSpecialties < ActiveRecord::Migration[5.0]
  def change
    create_table :specialties do |t|
      t.integer :specialty_id
      t.string :name

      t.timestamps
    end
  end
end
