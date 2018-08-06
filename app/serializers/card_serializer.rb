class CardSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :description, :created_by, :created_at, :updated_at
  # model association
  has_many :comments

  def comments
    Comment.limited_comments
  end

end
