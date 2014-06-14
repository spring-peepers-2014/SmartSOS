class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :campaign
      t.belongs_to :item
      t.integer :quantity

      t.timestamps
    end
  end
end
