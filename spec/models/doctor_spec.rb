require 'rails_helper'

RSpec.describe Doctor, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:reviews).dependent(:destroy) }
  # Validation tests
  # ensure columns name and address are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
