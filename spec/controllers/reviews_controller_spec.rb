require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  login_user
  before {
    @product = FactoryGirl.create(:product)
    @review = FactoryGirl.create(:review)
    @product.reviews.push(@review)
  }

  describe "GET reviews#new" do
    it "returns http success" do
      get :new, params: {product_id: @product.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET reviews#edit" do
    it "returns http success" do
      get :edit, params: {product_id: @product.id, id: @review.id}
      expect(response).to have_http_status(:success)
    end
  end
end
