class AddCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :company
      t.string :tax_number, :limit => 9
      t.boolean :re_income, :default => false
      t.string :email
      t.string :telephone
      t.string :mobile
      t.string :contact_person
      t.string :notes
    end
  end
end
