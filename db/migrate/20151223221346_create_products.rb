class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :category, index: true, foreign_key: true
      t.decimal :price, precision: 2, :scale => 8
      t.date :released_on

      t.timestamps null: false
    end
    # add_index :products, :category_id 
  end
end
