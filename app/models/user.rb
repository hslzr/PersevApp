class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy

  after_create :send_welcome_email


  private

  def send_welcome_email
    UserNotifierMailer.send_welcome_email(self).deliver
  end
end
