class Event < ApplicationRecord
  belongs_to :account
  belongs_to :calendar
  belongs_to :section
end
