class Account < ApplicationRecord
  # Relations
  has_one :group
  has_many :calendars
  has_many :events
  has_many :users
  has_many :sections
end
