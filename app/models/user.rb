class User < ApplicationRecord
  self.inheritance_column = :type
  # encrypt password
  has_secure_password

  scope :admins, -> { where(type: 'Admin') }
  scope :members , -> { where(type: 'Member') }

  # Model associations
  has_and_belongs_to_many :lists
  # Validations
  validates_presence_of :username, :email, :password_digest

end
class Admin < User;end
class Member < User;end