class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.belongs_to :donor
      t.belongs_to :item
      t.integer :quantity

      t.timestamps
    end
  end
end
