class Comment < ApplicationRecord
  # model association
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable , dependent: :destroy
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true

  # scope
  scope :limited_comments, lambda { limit(3) }

  # Validations
  validates_presence_of :body

  def created_user? user
    self.created_by == user.id
  end
end
