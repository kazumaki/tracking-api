class User < ApplicationRecord
  has_many :measurements
  validates_presence_of [:name, :email, :password_digest]
  validates_uniqueness_of :email
end
