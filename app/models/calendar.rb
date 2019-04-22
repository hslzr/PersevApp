class Calendar < ApplicationRecord
  belongs_to :group
  has_many :events
end
