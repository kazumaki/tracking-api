require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:measurement_type) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:measurement_type) }
  it { should validate_presence_of(:value) }
end
