class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :status
      t.string :payment_method

      t.timestamps null: false
    end
  end
end
