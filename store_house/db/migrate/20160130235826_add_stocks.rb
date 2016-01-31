class AddStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :colour
      t.string :size
      t.integer :quantity
      t.references :article

      t.timestamps
    end
    add_index :stocks, :article_id
  end
end
