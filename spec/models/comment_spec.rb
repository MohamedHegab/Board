require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Association test
  it { should belong_to(:commentable) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should belong_to(:created_by) }

  # Validation test
  it { should validate_presence_of(:body) }
end
