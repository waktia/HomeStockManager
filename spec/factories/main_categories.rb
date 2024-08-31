FactoryBot.define do
  factory :main_category do
    sequence(:name){|n| "category_#{n}"}
    association :user, factory: :user
  end
end
