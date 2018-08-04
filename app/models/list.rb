class List < ApplicationRecord
  # Model associations
  has_and_belongs_to_many :users
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true
  has_many :cards, dependent: :destroy

  # Validations
  validates_presence_of :title

end
