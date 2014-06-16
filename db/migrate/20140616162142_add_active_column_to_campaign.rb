class AddActiveColumnToCampaign < ActiveRecord::Migration
  def up
    add_column :campaigns, :active, :boolean, default: true
  end

  def down
    remove_column :campaigns, :active
  end
end
