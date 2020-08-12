class MeasurementTypesController < ApplicationController
  def index
    @measurement_types = MeasurementType.all
    json_response(@measurement_types)
  end
end
