class V1::CommentsController < ApplicationController
  before_action :find_commentable
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = current_user.comments.paginate(page: params[:page], per_page: 10)
    json_response(@comments)
  end

  def show
    json_response(@comment)
  end

  def create
    @comment = @commentable.comments.create! comment_params
    json_response(@comment, :created)
  end

  def update
    @comment.update(comment_params)
    head :no_content
  end

  def destroy
    @comment.destroy
    head :no_content
  end

  private

  def comment_params
    params.permit(:body).merge(user_id: current_user.id)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id] && params[:card_id]
    @commentable = Card.find_by_id(params[:card_id]) if params[:card_id] && params[:comment_id] == nil
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
