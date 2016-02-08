class AddColours < ActiveRecord::Migration
  def change
    create_table :colours do |t|
      t.string :description
    end
  end
end
