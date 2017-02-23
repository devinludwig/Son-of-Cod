require 'rails_helper'

RSpec.describe Product, type: :model do
  it do
    should validate_presence_of(:name)
    should validate_presence_of(:price)
    should have_many(:reviews)
  end
end
