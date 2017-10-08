require 'rails_helper'
# Test suite for the Review model
RSpec.describe Review, type: :model do
  # Association test
  # ensure an item record belongs to a single doctor record
  it { should belong_to(:doctor) }
  # Validation test
  # ensure column rating is present before saving
  it { should validate_presence_of(:rating) }
end
