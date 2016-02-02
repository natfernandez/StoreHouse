class AddAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1, :limit => 50
      t.string :line_2, :limit => 50
      t.string :line_3, :limit => 50
      t.string :line_4, :limit => 50
      t.string :post_code, :limit =>5

      t.references :addressable, polymorphic: true
    end
    add_index :addresses, [:addressable_id, :addressable_type], :unique => true
  end
end
