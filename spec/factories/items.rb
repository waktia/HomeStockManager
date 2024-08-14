FactoryBot.define do
  factory :item do
    name { "シャンプー" }
    association :main_category, factory: :main_category
    stock { 100 }
    days { 30 }
    association :user, factory: :user
  end
end
