FactoryGirl.define do
  sequence(:username) { |n| "Example username #{n}" }

  factory :user do
    username
    email "doa9595@gmail.com"
  end
end
