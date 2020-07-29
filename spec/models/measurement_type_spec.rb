require 'rails_helper'

RSpec.describe MeasurementType, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:unit) }
end
