class AddBusinesses < ActiveRecord::Migration
  class AddModelBusinesses < ActiveRecord::Migration
    def change
      create_table :businesses do |t|
        t.string :name
        t.string :company
        t.string :tax_number, :limit => 9
        t.string :email
        t.string :telephone
        t.string :mobile
        t.string :via_type, :limit => 20
        t.string :via, :limit =>60
        t.string :number, :limit => 10
        t.string :floor, :limit => 10
        t.string :stair, :limit => 10
        t.string :town, :limit => 30
        t.string :city, :limit => 30
        t.string :post_code, :limit =>5
      end
    end
  end
end
