require 'rails_helper'

describe "read status filtering checkboxes", js: true do
  before(:each) do
    @link = create(:link)
    @link_2 = create(:link, title: "this link has been read", user: @link.user, read: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@link.user)
  end

  it "hides unread stories when clicking show only read" do
    visit links_path

    check "filter-read"

    expect(page).to have_content(@link_2.title)
    expect(page).to_not have_content(@link.title)
  end

  it "hides read stories when clicking show only unread" do
    visit links_path

    check "filter-unread"

    expect(page).to_not have_content(@link_2.title)
    expect(page).to have_content(@link.title)
  end
end
