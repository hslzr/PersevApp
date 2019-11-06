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

  has_many_attached :images
  has_many_attached :documents

  # Validations
  #   Project attributes
  validates :name, presence: true

  #   Attachments
  validates :images, size: { less_than: 5.megabytes },
                     content_type: FileFormat.images,
                     limit: { max: 7 }

  validates :documents, size: { less_than: 5.megabytes },
                        content_type: FileFormat.documents,
                        limit: { max: 10 }


  private

  def generate_hexid
    self.hexid = SecureRandom.hex(4)
  end
end
