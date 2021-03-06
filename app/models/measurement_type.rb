class MeasurementType < ApplicationRecord
  has_many :measurements, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :unit
end
