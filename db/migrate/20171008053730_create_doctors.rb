class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.integer :doctor_id
      t.integer :group_id
      t.string :name
      t.string :image
      t.string :address
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
