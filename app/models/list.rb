class List < ApplicationRecord
  # Model associations
  has_and_belongs_to_many :users
end
