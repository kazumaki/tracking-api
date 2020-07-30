class Measurement < ApplicationRecord
  belongs_to :measurement_type

  validates_presence_of :measurement_type
  validates_presence_of :value
end
