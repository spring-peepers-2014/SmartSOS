class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.belongs_to :organization
      t.string :name, null: false
      t.text :description, null: false
      t.text :city
      t.text :state
      t.text :country
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
