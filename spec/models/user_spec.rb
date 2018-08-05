require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  it { should have_and_belong_to_many(:lists) }
  # Validation tests
  # ensure username, email and password_digest are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
