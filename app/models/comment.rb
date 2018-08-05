class Comment < ApplicationRecord
  # model association
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable , dependent: :destroy
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true

  # Validations
  validates_presence_of :body

end
