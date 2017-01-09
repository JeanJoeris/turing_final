FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jean-#{n}@example.com"}
    password "1234"
    password_confirmation "1234"
  end
end
