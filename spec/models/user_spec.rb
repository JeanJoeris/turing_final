require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires unique email" do
    User.create(email: "person@example.com", password: "123", password_confirmation: "123")
    duplicate = User.new(email: "person@example.com", password: "123", password_confirmation: "123")

    expect(duplicate.valid?).to be(false)
  end
end
