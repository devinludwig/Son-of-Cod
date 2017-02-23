require 'rails_helper'

RSpec.describe Review, type: :model do
  it do
    should belong_to :product
    should belong_to :user
    validate_presence_of :content
  end
end
