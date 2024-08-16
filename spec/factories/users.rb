FactoryBot.define do
  factory :user do
    name { "sample" }
    sequence(:email) { |n| "sample#{n}@sample.com" }
    password { "sample" }
    activated { true }
  end
end
