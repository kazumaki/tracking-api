require 'rails_helper'

RSpec.describe "MeasurementTypes", type: :request do
  let!(:measurement_types) {create_list(:measurement_type, 10)}
  let(:user) {create(:user)}
  let(:headers) { valid_headers }

  describe 'GET /measurement_types' do
    before { get '/measurement_types', params: {}, headers: headers }

    context 'when is a valid request' do
      it 'returns the measurement types list' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
