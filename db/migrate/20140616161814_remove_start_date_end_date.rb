class RemoveStartDateEndDate < ActiveRecord::Migration
  def up
    remove_column :campaigns, :start_date
  end

  def down
    add_column :campaigns, :start_date, :date
  end
end
