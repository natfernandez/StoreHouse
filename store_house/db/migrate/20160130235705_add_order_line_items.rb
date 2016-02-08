class AddOrderLineItems < ActiveRecord::Migration
  def change
    create_table :order_line_items do |t|
      t.references :order
      t.references :article, :null => false
      t.string :colour
      t.integer :size
      t.integer :quantity
      t.decimal :price, :precision => 5, :scale => 2

    end
    add_index :order_line_items, :order_id
    add_index :order_line_items, :article_id
  end
end
