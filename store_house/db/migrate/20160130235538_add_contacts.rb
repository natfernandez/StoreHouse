class AddContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, :null => false
      t.string :company
      t.string :tax_number, :limit => 9
      t.boolean :re_income, :default => false
      t.string :email
      t.string :telephone
      t.string :mobile
      t.string :contact_person
      t.string :notes
      t.decimal :risk, :precision => 5, :scale => 2
      t.datetime :deleted_at
    end
  end
end
