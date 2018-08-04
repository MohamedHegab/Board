class List < ApplicationRecord
  # Model associations
  has_and_belongs_to_many :users
  # Validations
  validates_presence_of :title
end
