class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :num_reservations
      t.boolean :seller_confirmed, default: false
      t.boolean :buyer_confirmed, default: false
      t.references :listing, index: true
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
