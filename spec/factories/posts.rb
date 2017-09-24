FactoryGirl.define do
  sequence(:title) { |n| "Example post title #{n}" }

  factory :post do
    title
    content "MyText"
    user
  end
end
