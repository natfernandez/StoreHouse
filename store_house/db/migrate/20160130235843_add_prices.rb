class AddPrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.date :date_from, :default => Time.now
      t.date :date_to
      t.references :article
      t.references :cost

      t.timestamps
    end
  end
end
