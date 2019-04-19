class Group < ApplicationRecord
  has_many :users, dependent: :nullify
end
