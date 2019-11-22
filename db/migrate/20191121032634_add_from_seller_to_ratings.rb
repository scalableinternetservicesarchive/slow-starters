class AddFromSellerToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :from_seller, :boolean
  end
end
