class Campaign < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :organization
  has_many :donors
  has_many :requests
  has_many :requested_items, through: :requests
end
