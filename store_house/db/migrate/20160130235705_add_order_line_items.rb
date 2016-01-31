class AddOrderLineItems < ActiveRecord::Migration
  def change
    create_table :orders_line_items do |t|
      t.string :colour
      t.integer :size
      t.decimal :price, :precision => 5, :scale => 2

      t.references :order
      t.references :article
    end
    add_index :orders_line_items, :order_id
    add_index :orders_line_items, :article_id
  end
end
