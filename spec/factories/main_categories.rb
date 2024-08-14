FactoryBot.define do
  factory :main_category do
    name { "sample" }
    association :user, factory: :user
  end
end
