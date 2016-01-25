class AddOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number, :null => false
      t.date :date, :null => false
      t.decimal :discount, :precision => 5, :scale => 2, :default => 0
      t.date :deliver_date

      t.references :customer
      t.references :article

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :article_id
  end
end
