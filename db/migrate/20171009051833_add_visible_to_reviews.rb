class AddVisibleToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :visible, :boolean, default: false
  end
end
