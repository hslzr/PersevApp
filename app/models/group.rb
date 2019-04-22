class Group < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :sections
end
