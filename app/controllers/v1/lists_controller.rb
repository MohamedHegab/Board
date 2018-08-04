class V1::ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy, :assign_member, :unassign_member]
  before_action :set_user, only: [:assign_member, :unassign_member]

  def index
    # get current user lists
    @lists = current_user.lists
    json_response(@lists)
  end


  def create
    # create lists belonging to current user & add current user as a member
    @list = current_user.created_lists.create!(list_params)
    current_user.lists << @list
    json_response(@list, :created)
  end

  def show
    json_response(@list.cards)
  end

  def update
    @list.update(list_params)
    head :no_content
  end

  def destroy
    @list.destroy
    head :no_content
  end

  def assign_member
    @list.users << @user
    head :no_content
  end

  def unassign_member
    @list.users.delete(@user)
    head :no_content
  end

  private

  def list_params
    params.permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
