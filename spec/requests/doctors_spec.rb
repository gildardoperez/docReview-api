require 'rails_helper'

RSpec.describe 'Doctors API', type: :request do
  let!(:doctors) { create_list(:doctor, 20) }
  let(:doctor_id) { doctors.first.id }

  describe 'GET /doctors' do
    before { get '/doctors' }

    it 'returns doctors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /doctors/:id' do
    before { get "/doctors/#{doctor_id}" }

    context 'when the record exists' do

      it 'returns the doctor' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(doctor_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:doctor_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Doctor/)
      end
    end
  end

  describe 'POST /doctors' do
    let(:valid_attributes) { { name: 'Learn Elm', address: '222 S Main St' } }

    context 'when request is valid' do
      before { post '/doctors', params: valid_attributes }

      it 'creates a todo' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post '/doctors', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Address can't be blank\"}")
      end
    end
  end

  describe 'PUT /doctors/:id' do
    let(:valid_attributes) { { name: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/doctors/#{doctor_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /doctors/:id' do
    before { delete "/doctors/#{doctor_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end