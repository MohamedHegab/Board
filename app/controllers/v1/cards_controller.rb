class V1::CardsController < ApplicationController
  before_action :set_list
  before_action :set_list_card, only: [:show, :update, :destroy]
  before_action :set_user, only: [:index]
  before_action :authorize_user, only: [:update, :destroy]

  # GET /lists/:list_id/cards
  def index
    authorize @list , policy_class: CardPolicy
    json_response(@cards)
  end

  # GET /lists/:list_id/cards/:id
  def show
    json_response(@card)
  end

  # POST /lists/:list_id/cards
  def create
    authorize @list , policy_class: CardPolicy
    @list.cards.create!(card_params)
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
    params.permit(:title, :description).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_user
    # @cards = Card.created_by(current_user).order_by_comments
    @cards =  @list.cards.where(user_id: current_user.id).left_joins(:comments).group(:id).order(Arel.sql('COUNT(comments.id) DESC'))
  end

  def set_list_card
    @card = @list.cards.find_by!(id: params[:id]) if @list
  end

  def authorize_user
    authorize @card
  end
end
