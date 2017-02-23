require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should have_many :reviews
    should validate_presence_of :email
    should validate_presence_of :password
  end
end
