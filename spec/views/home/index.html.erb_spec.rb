require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :feature do
  it "displays the splash page" do
    visit(root_path)
    expect(page).to have_content("We were established in 1993 by a couple of Salmon slurpers and we've been proudly serving the Portland area ever since. You won't find fresher and more diverse seafood selections anywhere else!")
  end
end
