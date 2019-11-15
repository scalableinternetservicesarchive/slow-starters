class UpdateListingsFields < ActiveRecord::Migration[5.1]
  def change
    change_column :listings, :available_swipes, :integer, :default => 0
    change_column :listings, :has_completed, :boolean, :default => false
  end
end
