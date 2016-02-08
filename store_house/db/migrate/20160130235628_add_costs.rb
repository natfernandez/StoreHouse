class AddCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.references :article
      t.decimal :raw_material, :precision => 5, :scale => 2
      t.decimal :confection, :precision => 5, :scale => 2
      t.decimal :supplement, :precision => 5, :scale => 2
      t.decimal :supply, :precision => 5, :scale => 2

      t.timestamps
    end
    add_index :costs, :article_id
  end
end
