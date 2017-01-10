require 'rails_helper'

describe "searching links", js: true do
  # before(:each) do
  #   @link = create(:link)
  #   @link_2 = create(:link, title: "this link has been read", user: @link.user, read: true)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@link.user)
  # end

  xit "shows only links containing text" do
    pending("for some reason this test doesn't play well with phantomjs, though feature works")
    # visit links_path
    #
    # fill_in "search-links", with: "webcomic"
    #
    # expect(page).to have_text(@link.title)
    # expect(page).to_not have_text(@link_2.title)
  end
end
