class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  before_create :generate_hexid

  private

  def generate_hexid
    self.hexid = SecureRandom.hex(4)
  end
end
