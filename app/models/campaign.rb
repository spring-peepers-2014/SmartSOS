class Campaign < ActiveRecord::Base
  belongs_to :organization
  has_many :requests
  has_many :requested_items, through: :requests, source: :item
  has_many :pledges
  has_many :pledged_items, through: :pledges, source: :pledged_item
  has_many :donors, through: :pledges
  
  validates :name, presence: true
  validates :description, presence: true
  validates_length_of :description, maximum: 500
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_date :end_date, :after => :start_date
end
