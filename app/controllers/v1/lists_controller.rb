class V1::ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    # get current user lists
    @lists = current_user.lists
    json_response(@lists)
  end


  def create
    # create lists belonging to current user
    @list = current_user.lists.create!(list_params)
    json_response(@list, :created)
  end

  def show

  end

  def update
    @list.update(list_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @list.destroy
    head :no_content
  end
  private

  def list_params
    params.permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
