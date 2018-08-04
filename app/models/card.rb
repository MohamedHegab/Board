class Card < ApplicationRecord
  # model association
  belongs_to :list
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true

  # scopes
  scope :created_by, -> (user) { where('user_id = ?', user.id) }
  # validation
  validates_presence_of :title

end
