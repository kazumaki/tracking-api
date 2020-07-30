class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:update, :destroy, :show]

  def index
    @measurements = current_user.measurements
    json_response(@measurements)
  end

  def create
    @measurement = current_user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end

  def show
    json_response(@measurement)
  end

  def update
    @measurement.update(measurement_params)
    head :no_content
  end

  def destroy
    @measurement.destroy
    head :no_content
  end

  private

  def measurement_params
    params.permit(:value, :measurement_type_id)
  end

  def set_measurement
    @measurement = Measurement.find(params[:id])
  end
end
