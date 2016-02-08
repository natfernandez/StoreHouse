class AddBusinessData < ActiveRecord::Migration
  def change
    create_table :business_data do |t|
      t.string :name, :null => false
      t.string :company
      t.string :tax_number, :limit => 9
      t.string :email
      t.string :telephone
      t.string :mobile
    end
  end
end
