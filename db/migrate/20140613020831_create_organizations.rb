class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email
      t.string :phone
      t.text :description
      t.string :url
      
      t.timestamps
    end
  end
end
