require 'rails_helper'

describe "User account" do
  it "is required to access root" do
    visit root_path

    expect(current_path).to eq(login_path)
  end

  it "is created successfully" do
    visit login_path

    click_on "Go ahead and create one!"

    fill_in "user_email", with: "jean@example.com"
    fill_in "user_password", with: "123"
    fill_in "user_password_confirmation", with: "123"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("User created!")
  end

  it "requires email" do
    visit login_path

    click_on "Go ahead and create one!"

    fill_in "user_password", with: "123"
    fill_in "user_password_confirmation", with: "123"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Email can't be blank")
  end

  it "requires password" do
    visit login_path

    click_on "Go ahead and create one!"

    fill_in "user_email", with: "jean@example.com"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password can't be blank")
  end

  it "requires password to match password confirmation" do
    visit login_path

    click_on "Go ahead and create one!"

    fill_in "user_email", with: "jean@example.com"
    fill_in "user_password", with: "123"
    fill_in "user_password_confirmation", with: "1234"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it "is used to login" do
    user = create(:user)

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome back!")
  end

  it "fails to login with bad data" do
    user = create(:user)

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: "foo"
    click_on "Submit"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("We could not find that username/password combination")
  end

  it "logs out" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Sign out"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Goodbye!")
  end
end
