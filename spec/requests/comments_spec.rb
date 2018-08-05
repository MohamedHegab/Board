require 'rails_helper'

RSpec.describe 'Comments API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:list) { create(:list, created_by: user) }
  let!(:card) { create(:card, list: list, created_by: user) }
  let!(:comments) { create_list(:comment, 20, commentable: card, created_by: user) }
  let(:list_id) { list.id }
  let(:card_id) { card.id }
  let(:id) { comments.first.id }
  # authorize request
  let(:headers) { valid_headers }
  # index
  describe 'GET /lists/:list_id/cards/:card_id/comments' do
    before { get "/lists/#{list_id}/cards/#{card_id}/comments" ,params: { page: '1' }, headers: headers }

    context 'when Comments exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all list cards' do
        expect(json).not_to be_empty
        expect(json.size).to eq(10) #pagetion return 10 record
      end
    end

  end

  describe 'GET /lists/:list_id/cards/:card_id/comments/:id' do
    before { get "/lists/#{list_id}/cards/#{card_id}/comments/#{id}", params: {}, headers: headers  }

    context 'when list cards exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the cards' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when list Comments does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # create
  describe 'POST /lists/:list_id/cards/:card_id/comments' do
    let(:valid_attributes) { { body: 'Comment' }.to_json }

    context 'when request attributes are valid' do
      before { post "/lists/#{list_id}/cards/#{card_id}/comments", params: valid_attributes , headers: headers  }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/lists/#{list_id}/cards/#{card_id}/comments", params: {} , headers: headers}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Body can't be blank/)
      end
    end
  end

  # update
  describe 'PUT /lists/:list_id/cards/:card_id/comments/:id' do
    let(:valid_attributes) { { body: 'comment body' }.to_json }

    before { put "/lists/#{list_id}/cards/#{card_id}/comments/#{id}", params: valid_attributes  , headers: headers }

    context 'when comment exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the comment' do
        updated_cards = Comment.find(id)
        expect(updated_cards.body).to match(/comment body/)
      end
    end

    context 'when the cards does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # delete
  describe 'DELETE /lists/:list_id/cards/:card_id/comments/:id' do
    before { delete "/lists/#{list_id}/cards/#{card_id}/comments/#{id}", params: {} , headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
