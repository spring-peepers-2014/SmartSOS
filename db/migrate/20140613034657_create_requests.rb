class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
