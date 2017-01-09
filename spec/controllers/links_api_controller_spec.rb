require 'rails_helper'

RSpec.describe Api::V1::LinksController do
  it "marks links as read" do
    link = create(:link)

    put :update, id: link.id, read: true
    response_link = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_link[:read]).to eq(true)
    expect(Link.find(link.id).read).to eq(true)
  end

  it "shows a link" do
    link = create(:link)

    get :show, id: link.id
    response_link = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_link[:title]).to eq(link.title)
    expect(response_link[:url]).to eq(link.url)
  end
end
