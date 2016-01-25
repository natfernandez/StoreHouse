class AddArticles < ActiveRecord::Migration
def change
    create_table :articles do |t|
      t.string :code, :null => false, :limit => 4
      t.string :description, :null => false, :limit => 150
      t.decimal :sales_price, :precision => 5, :scale => 2

      t.timestamps
    end
  end
end
