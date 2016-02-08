class AddSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :description
      t.string :type, :null => false, :limit => 5
    end
  end
end
