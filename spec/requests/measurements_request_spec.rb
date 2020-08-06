require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  let(:user) { create(:user) }
  let!(:measurements) { create_list(:measurement, 10, user: user) }
  let(:measurement_id) { measurements.first.id }

  let(:headers) { valid_headers }

  describe 'GET /measurements' do
    before { get '/measurements', params: {}, headers: headers }

    context 'When is a valid request' do
      it 'returns the measurements list' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET /measurements/:id' do
    before { get "/measurements/#{measurement_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the measurement' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(measurement_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:measurement_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Measurement/)
      end
    end
  end

  describe 'POST /measurements' do
    let!(:measurement_type) { create(:measurement_type) }
    let!(:user) { create(:user) }
    let(:valid_attributes) { { measurementType: measurement_type.id, value: 2.5 }.to_json }

    context 'when the request is valid' do
      before { post '/measurements', params: valid_attributes, headers: headers }

      it 'creates a measurement' do
        expect(json['value']).to eq('2.5')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/measurements', params: { value: 2.5 }.to_json, headers: headers }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Couldn't find MeasurementType without an ID/)
      end
    end
  end

  describe 'PUT /measurements/:id' do
    let(:valid_attributes) { { value: 3.5 }.to_json }

    context 'when the record exists' do
      before { put "/measurements/#{measurement_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /measurements/:id' do
    before { delete "/measurements/#{measurement_id}", headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
