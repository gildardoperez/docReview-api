require 'rails_helper'

RSpec.describe 'Reviews API' do
  let!(:doctor) { create(:doctor) }
  let!(:reviews) { create_list(:review, 20, doctor_id: doctor.id) }
  let(:doctor_id) { doctor.id }
  let(:id) { reviews.first.id }

  describe 'GET /doctors/:doctor_id/reviews' do
    before { get "/doctors/#{doctor_id}/reviews" }

    context 'when doctor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all doctor reviews' do
        expect(json.size).to eq(20)
      end
    end

    context 'when doctor does not exist' do
      let(:doctor_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Doctor/)
      end
    end
  end

  describe 'GET /doctors/:doctor_id/reviews/:id' do
    before { get "/doctors/#{doctor_id}/reviews/#{id}" }

    context 'when doctor review exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the review' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when doctor review does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Review with [WHERE \\\"reviews\\\".\\\"doctor_id\\\" = ? AND \\\"reviews\\\".\\\"id\\\" = ?]\"}")
      end
    end
  end

  describe 'POST /doctors/:doctor_id/reviews' do
    let(:valid_attributes) { { comment: 'Visit Narnia' } }

    context 'when request attributes are valid' do
      before { post "/doctors/#{doctor_id}/reviews", params: valid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when an invalid request' do
      before { post "/doctors/#{doctor_id}/reviews", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match("{\"message\":\"Validation failed: Rating can't be blank\"}")
      end
    end
  end

  describe 'PUT /doctors/:doctor_id/reviews/:id' do
    let(:valid_attributes) { { comment: 'Mozart' } }

    before { put "/doctors/#{doctor_id}/reviews/#{id}", params: valid_attributes }

    context 'when review exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the review' do
        updated_review = Review.find(id)
        expect(updated_review.comment).to match(/Mozart/)
      end
    end

    context 'when review does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Review with [WHERE \\\"reviews\\\".\\\"doctor_id\\\" = ? AND \\\"reviews\\\".\\\"id\\\" = ?]\"}")
      end
    end
  end

  describe 'DELETE /doctors/:id' do
    before { delete "/doctors/#{doctor_id}/reviews/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end