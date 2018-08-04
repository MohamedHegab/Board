require 'rails_helper'

RSpec.describe 'Cards API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:list) { create(:list, created_by: user) }
  let!(:cards) { create_list(:card, 20, list: list, created_by: user) }
  let(:list_id) { list.id }
  let(:id) { cards.first.id }
  # authorize request
  let(:headers) { valid_headers }
  # Test suite for GET /lists/:list_id/cards
  describe 'GET /lists/:list_id/cards' do
    before { get "/lists/#{list_id}/cards" ,params: {}, headers: headers }

    context 'when list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all list cards' do
        expect(json.size).to eq(20)
      end
    end

    context 'when list does not exist' do
      let(:list_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  # Test suite for GET /lists/:list_id/cards/:id
  describe 'GET /lists/:list_id/cards/:id' do
    before { get "/lists/#{list_id}/cards/#{id}", params: {}, headers: headers  }

    context 'when list cards exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the cards' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when list cards does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end
  end

  # Test suite for PUT /lists/:list_id/cards
  describe 'POST /lists/:list_id/cards' do
    let(:valid_attributes) { { title: 'Visit Ahmed', description: 'description for card' }.to_json }

    context 'when request attributes are valid' do
      before { post "/lists/#{list_id}/cards", params: valid_attributes , headers: headers  }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/lists/#{list_id}/cards", params: {} , headers: headers}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Cards is invalid/)
      end
    end
  end

  # Test suite for PUT /lists/:list_id/cards/:id
  describe 'PUT /lists/:list_id/cards/:id' do
    let(:valid_attributes) { { title: 'card_title' }.to_json }

    before { put "/lists/#{list_id}/cards/#{id}", params: valid_attributes  , headers: headers }

    context 'when cards exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the cards' do
        updated_cards = Card.find(id)
        expect(updated_cards.title).to match(/card_title/)
      end
    end

    context 'when the cards does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Card/)
      end
    end
  end

  # Test suite for DELETE /lists/:id
  describe 'DELETE /lists/:id' do
    before { delete "/lists/#{list_id}/cards/#{id}", params: {} , headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end