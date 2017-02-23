require 'rails_helper'

RSpec.describe "products/edit.html.erb", type: :feature do
  before {
    User.delete_all
    admin = FactoryGirl.create(:admin)
    sign_in admin
    @product = FactoryGirl.create(:product)
    }

    it "displays the product editing form when an admin user clicks the edit product button" do
      visit(root_path)
      click_link('Add Product')
      expect(page).to have_content('New Product
      Name
      Description
      Price')
    end

    it "updates a products attributes when an admin user submits update form" do
      visit edit_product_path(@product)
      fill_in'product_name', :with => 'squid'
      fill_in 'product_description', :with => 'squiggly thing'
      fill_in 'product_price', :with => 9.99
      click_on 'Save Product'
      expect(page).to have_content 'Product has been updated Product: squid Description: squiggly thing Price: 9.99'
    end
end
