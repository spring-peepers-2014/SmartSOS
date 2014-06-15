class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :requested_item, class_name: "Item", foreign_key: :item_id
  validates :quantity, numericality: { greater_than: 0 }
end
