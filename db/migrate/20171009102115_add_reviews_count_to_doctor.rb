class AddReviewsCountToDoctor < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :reviews_count, :integer, :default => 0
  end
end
