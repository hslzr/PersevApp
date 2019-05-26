class Group < ApplicationRecord
  has_one :calendar
  has_many :users, dependent: :nullify
  has_many :sections
end
