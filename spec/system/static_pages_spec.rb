require "rails_helper"


RSpec.describe "have links", type: :system do
  before do
    driven_by(:rack_test)
  end
  scenario " have links" do
    visit root_path
    expect(page).to have_current_path "/"
    expect(page).to have_link "Home", href: "/"
    # expect(page).to have_link "Help", href: "/help"
  end
end
