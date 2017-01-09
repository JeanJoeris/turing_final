require 'rails_helper'

RSpec.describe Link, type: :model do
  it "requires valid urls" do
    link = Link.new(url: "a string", title: "this is invalid")

    expect(link.valid?).to eq(false)
  end

  it "requires title and url" do
    link_1 = Link.new(url: "http://xkcd.com")
    link_2 = Link.new(title: "this is invalid")

    expect(link_1.valid?).to eq(false)
    expect(link_2.valid?).to eq(false)
  end

  it "returns ordered links by user" do
    Link.create(url: "http://xkcd.com", title: "a great webcomic", user_id: 1)
    Link.create(url: "http://penny-arcade.com", title: "a good webcomic", user_id: 1)
    Link.create(url: "http://penny-arcade.com", title: "a good webcomic", user_id: 2)
    ordered_links = Link.by_user_id(1)

    expect(ordered_links.count).to eq(2)
    # expect to return in _reverse_ of creation order
    expect(ordered_links.first.title).to eq("a good webcomic")
    expect(ordered_links.last.title).to eq("a great webcomic")
  end
end
