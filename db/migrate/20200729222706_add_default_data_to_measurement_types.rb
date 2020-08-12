class AddDefaultDataToMeasurementTypes < ActiveRecord::Migration[6.0]
  def change
    MeasurementType.create name: 'waist', unit: 'cm'
    MeasurementType.create name: 'hips', unit: 'cm'
    MeasurementType.create name: 'left bicep', unit: 'cm'
    MeasurementType.create name: 'right bicep', unit: 'cm'
    MeasurementType.create name: 'left thigh', unit: 'cm'
    MeasurementType.create name: 'right thigh', unit: 'cm'
    MeasurementType.create name: 'weight', unit: 'kg'
  end
end
