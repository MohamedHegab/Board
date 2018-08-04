class V1::CardsController < ApplicationController
  before_action :set_list
  before_action :set_list_card, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index]

  # GET /lists/:list_id/cards
  def index
    json_response(@cards)
  end

  # GET /lists/:list_id/cards/:id
  def show
    json_response(@card)
  end

  # POST /lists/:list_id/cards
  def create
    @list.cards.create(card_params).created_by = current_user
    @list.save!
    json_response(@list, :created)
  end

  # PUT /lists/:list_id/cards/:id
  def update
    @card.update(card_params)
    head :no_content
  end

  # DELETE /lists/:list_id/cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def card_params
    params.permit(:title, :description)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_user
    @cards = @list.cards.created_by(current_user)
  end

  def set_list_card
    @card = @list.cards.find_by!(id: params[:id]) if @list
  end
end
