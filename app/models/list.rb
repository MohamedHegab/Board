class List < ApplicationRecord
  after_create_commit :assign_user

  # Model associations
  has_and_belongs_to_many :users
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'user_id', :validate => true
  has_many :cards, dependent: :destroy

  # Validations
  validates_presence_of :title

  def created_user? user
    self.created_by == user
  end

  private

  #assign Created list user to be member
  def assign_user
    self.users << self.created_by
  end

end
