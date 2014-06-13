class Pledge < ActiveRecord::Base
  belongs_to :donor
  belongs_to :campaign
  belongs_to :pledged_item, class_name: "Item", foreign_key: :item_id
end
