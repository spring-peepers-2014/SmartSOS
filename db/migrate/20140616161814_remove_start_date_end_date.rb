class RemoveStartDateEndDate < ActiveRecord::Migration
  def up
    remove_column :campaigns, :start_date
    remove_column :campaigns, :end_date
  end

  def down
    add_column :campaigns, :start_date, :date
    add_column :campaigns, :end_date, :date
  end
end
