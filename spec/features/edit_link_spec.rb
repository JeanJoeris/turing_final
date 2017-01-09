require 'rails_helper'

describe "edit link" do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "succesfully edits with proper url" do
    link = create(:link)

    visit links_path

    click_on "Edit"
    fill_in "link_title", with: "A thing"
    fill_in "link_url", with: "http://google.com"
    click_on "Update Link"

    expect(page).to have_text("A thing")
    expect(page).to have_text("http://google.com")
    expect(page).to_not have_text(link.title)
    expect(page).to_not have_text(link.url)
  end

  it "fails edit with bad url" do
    link = create(:link)

    visit links_path

    click_on "Edit"
    fill_in "link_title", with: "A thing"
    fill_in "link_url", with: "google.com"
    click_on "Update Link"

    expect(page).to have_text("Url is not a valid URL")
  end
end
