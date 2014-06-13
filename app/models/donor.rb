class Donor < ActiveRecord::Base
  belongs_to :campaign
  has_many :pledges
  has_many :donated_items, through: :pledges
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :password, presence: true
end
