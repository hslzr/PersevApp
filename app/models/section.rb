class Section < ApplicationRecord
  belongs_to :account
  belongs_to :group
  has_many :users
  has_many :events

  def calendar
    group.calendar
  end
end
