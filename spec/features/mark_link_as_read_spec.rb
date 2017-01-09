require 'rails_helper'

describe "mark link as read", js: true do
  before(:each) do
    link = create(:link)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(link.user)
  end

  it "updates the read? status displayed" do
    visit links_path

    expect(page).to have_text("Read?: false")

    click_on "Mark as Read"

    expect(page).to have_text("Read?: true")
    expect(page).to have_content("Mark as Unread")
  end
end
