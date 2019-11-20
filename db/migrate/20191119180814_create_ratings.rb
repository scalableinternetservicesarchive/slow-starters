class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.boolean :from_sender
      t.integer :score
      t.text :comment, default: false
      
      t.references :reservation, index: true
      
      t.timestamps
    end
  end
end
