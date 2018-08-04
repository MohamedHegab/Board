require 'rails_helper'

RSpec.describe List, type: :model do
  # Association test
  it { should have_and_belong_to_many(:users) }
  it { should belong_to(:created_by) }
  it { should have_many(:cards).dependent(:destroy) }
  # Validation tests
  # ensure username, email and password_digest are present before save
  it { should validate_presence_of(:title) }
end
