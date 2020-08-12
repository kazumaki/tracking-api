class User < ApplicationRecord
  has_secure_password

  has_many :measurements, dependent: :destroy
  validates_presence_of %i[name email password_confirmation password_digest]
  validates_uniqueness_of :email
end
