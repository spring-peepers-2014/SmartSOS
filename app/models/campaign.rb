class Campaign < ActiveRecord::Base
  validates :description, presence: true
end
