class UpdateListingsFields2 < ActiveRecord::Migration[5.1]
  def change
    change_column :listings, :available_swipes, :integer
    change_column :listings, :swipes_reserved, :integer, :default => 0
    change_column :listings, :has_completed, :boolean, :default => false
  end
end
