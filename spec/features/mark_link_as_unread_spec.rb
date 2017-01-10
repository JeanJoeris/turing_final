require 'rails_helper'

describe "mark link as unread", js: true do
  it "updates the read? status, client and server side" do
    link = create(:link)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(link.user)

    visit links_path

    click_on "Mark as Read"
    click_on "Mark as Unread"

    expect(page).to have_text("Read?: false")
    expect(page).to have_content("Mark as Read")
    expect(Link.find(link.id).read).to eq(false)
  end

  it "button appears by default for links which have already been read" do
    link = create(:link, read: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(link.user)

    visit links_path

    expect(page).to have_content("Mark as Unread")

    click_on "Mark as Unread"

    expect(page).to have_text("Read?: false")
    expect(page).to have_content("Mark as Read")
  end
end
