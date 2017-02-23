require 'rails_helper'

RSpec.describe "products/new.html.erb", type: :feature do
  before {
    User.delete_all
    admin = FactoryGirl.create(:admin)
    sign_in admin
    }
  it "displays the new product form when an admin user clicks the new product button" do
    visit(root_path)
    click_link('Add Product')
    expect(page).to have_content('New Product
    Name
    Description
    Price')
  end

  it "creates a new product when an admin user submits the form" do
    visit(new_product_path)
    fill_in'product_name', :with => 'squid'
    fill_in 'product_description', :with => 'squiggly thing'
    fill_in 'product_price', :with => 9.99
    click_on 'Save Product'
    expect(page).to have_content 'Product was successfully saved Product: squid Description: squiggly thing Price: 9.99'
  end
end
