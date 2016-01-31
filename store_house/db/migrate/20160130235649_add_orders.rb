class AddOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number, :null => false
      t.date :date, :null => false
      t.decimal :discount, :precision => 5, :scale => 2, :default => 0
      t.date :deliver_date
      t.date :voided_at

      t.references :customer

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
