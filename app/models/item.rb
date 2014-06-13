class Item < ActiveRecord::Base
  has_many :pledges
  has_many :requests
  validates :asin, presence: true, uniqueness:true
  validates :name, presence: true
  validates :img_url, presence: true
  validates :price, presence: true

  def price_dollars
    self.price / 100.0
  end

  def price_dollars=(val)
    self.price = val * 100
  end
end
