FactoryGirl.define do
  factory :link do
    url "http://xkcd.com"
    title "A great webcomic"
    user
  end
end
