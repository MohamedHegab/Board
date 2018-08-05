class CommentSerializer < ActiveModel::Serializer
    # attributes to be serialized
    attributes :id, :body, :created_by, :created_at, :updated_at
    # model association
    has_many :comments
end
