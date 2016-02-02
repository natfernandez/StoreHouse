class AddPrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.date :date_from, :default => Time.now
      t.date :date_to
      t.decimal  :cost_price, :precision => 5, :scale => 2
      t.decimal  :sale_price, :precision => 5, :scale => 2

      t.references :priceable, polymorphic: true
      t.timestamps
    end
    add_index :prices, [:priceable_id, :priceable_type], :unique => true
  end
end
