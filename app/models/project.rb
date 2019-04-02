class Project < ApplicationRecord
  # Relations
  belongs_to :user
  has_many :tasks, dependent: :destroy

  # Enums
  enum field: {
    travel: 'Viajes y experiencias interculturales',
    adventure: 'Aventuras al aire libre',
    service: 'Servicio a la comunidad',
    economic: 'Integración social y económica',
    other: 'Otro'
  }

  # Callbacks
  before_create :generate_hexid

  # Attachments
  has_rich_text :what_todo
  has_rich_text :how_todo
  has_rich_text :why_todo

  private

  def generate_hexid
    self.hexid = SecureRandom.hex(4)
  end
end
