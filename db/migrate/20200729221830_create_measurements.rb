class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.references :measurement_type, null: false, foreign_key: true
      t.decimal :value, precision: 6, scale: 2

      t.timestamps
    end
  end
end
