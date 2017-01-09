require 'rails_helper'

describe "edit link", :js => :true do
  before(:each) do
    link = create(:link)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(link.user)
  end

  it "succesfully edits with proper url" do
    visit links_path
    click_on "Edit"
    fill_in "link_title", with: "A thing"
    fill_in "link_url", with: "http://google.com"
    click_on "Update Link"

    expect(page).to have_text("A thing")
    expect(page).to have_text("http://google.com")
  end

  it "fails edit with bad url" do
    visit links_path

    click_on "Edit"
    fill_in "link_title", with: "A thing"
    fill_in "link_url", with: "google.com"
    click_on "Update Link"

    expect(page).to have_text("Url is not a valid URL")
  end

  it "fails edit with no title" do
    link = create(:link)

    visit links_path

    click_on "Edit"
    fill_in "link_title", with: ""
    fill_in "link_url", with: "google.com"
    click_on "Update Link"

    expect(page).to have_text("Title can't be blank")
  end
end
