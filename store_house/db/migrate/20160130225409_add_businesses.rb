class AddBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :company
      t.string :tax_number, :limit => 9
      t.string :email
      t.string :telephone
      t.string :mobile
    end
  end
end
