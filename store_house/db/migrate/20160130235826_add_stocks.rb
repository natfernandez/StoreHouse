class AddStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :article
      t.references :colour
      t.references :size
      t.integer :quantity

      t.timestamps
    end
    add_index :stocks, [:article_id, :colour_id, :size_id]
  end
end
