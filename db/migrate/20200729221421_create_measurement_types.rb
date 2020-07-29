class CreateMeasurementTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :measurement_types do |t|
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
