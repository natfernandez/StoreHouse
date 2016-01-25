class AddAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :via_type, :limit => 20
      t.string :via, :limit =>60
      t.string :number, :limit => 10
      t.string :floor, :limit => 10
      t.string :stair, :limit => 10
      t.string :town, :limit => 30
      t.string :city, :limit => 30
      t.string :post_code, :limit =>5

      t.references :customer
    end
    add_index :addresses, :customer_id
  end
end
