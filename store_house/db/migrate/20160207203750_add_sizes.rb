class AddSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.references :colour
      t.string :description
    end
    add_index :sizes, :colour_id
  end
end
