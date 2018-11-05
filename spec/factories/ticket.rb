FactoryBot.define do
  factory :ticket do
    description { "Algum problema" }
    customer
    priority
    status
    association :admin, factory: :user
    user
  end
end
