class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :requested_item, class_name: "Item"
end
