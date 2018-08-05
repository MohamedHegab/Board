class Card < ApplicationRecord
  # model association
  belongs_to :list
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true
  has_many :comments, as: :commentable , dependent: :destroy

  # scopes
  scope :created_by, -> (user) { where('user_id = ?', user.id) }
  scope :order_by_comments, -> { left_joins(:comments).group(:id).order(Arel.sql('COUNT(comments.id) DESC'))}

  # validation
  validates_presence_of :title

end
