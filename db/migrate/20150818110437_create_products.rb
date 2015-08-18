class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false, default: 0
      t.integer :stock, null: false

      t.timestamps null: false
    end
  end
end
