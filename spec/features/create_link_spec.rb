require "rails_helper"

RSpec.describe "can create links", :js => :true do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario "Create a new link" do
    visit "/"
    fill_in "link-title", :with => "Turing"
    fill_in "link-url", :with => "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text("Read?: false")
    end
    expect(Link.count).to eq(1)
  end

  # scenario "fails with non-url" do
  #   visit "/"
  #
  #   fill_in "link-title", :with => "Turing"
  #   fill_in "link-url", :with => "turing.io"
  #   click_on "Add Link"
  #
  #   expect(page).to have_text("Url is not a valid URL")
  # end
end
