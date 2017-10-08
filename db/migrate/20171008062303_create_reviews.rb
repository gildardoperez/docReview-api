class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :review_id
      t.integer :rating
      t.text :comment
      t.references :doctor, foreign_key: true

      t.timestamps null: false
    end
  end
end
