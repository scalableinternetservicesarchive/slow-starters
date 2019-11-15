class AddFieldsToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :location, :integer
    add_column :listings, :available_swipes, :integer
    add_column :listings, :swipes_reserved, :integer
    add_column :listings, :time, :datetime
    add_column :listings, :has_completed, :boolean
  end
end
