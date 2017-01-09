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
end
