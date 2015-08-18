class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :status, null: false, default: '新訂單'
      t.string :payment_method

      t.timestamps null: false
    end
  end
end
