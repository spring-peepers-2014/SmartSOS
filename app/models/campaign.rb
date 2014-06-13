class Campaign < ActiveRecord::Base
  belongs_to :organization
  has_many :requests
  has_many :requested_items, through: :requests, source: :item
  has_many :pledges
  has_many :pledged_items, through: :pledges, source: :item
  has_many :donors, through: :pledges
  
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  
end
