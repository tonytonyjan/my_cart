class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.decimal :unit_price, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end
  end
end
