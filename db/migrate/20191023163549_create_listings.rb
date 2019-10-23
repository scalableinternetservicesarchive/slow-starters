class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.text :description

      t.timestamps
    end
  end
end
