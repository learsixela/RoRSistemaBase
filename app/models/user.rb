class User < ApplicationRecord
  has_secure_password
  #relaciones

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :password, length: {minimum: 8, maximum: 72}, on: :create
  validates :nombre, :apellido, :email, presence: true
  validates :nombre, :apellido, length: {minimum: 2}
  before_save :downcase_email

  private
  def downcase_email
    self.email.downcase!
  end
end
