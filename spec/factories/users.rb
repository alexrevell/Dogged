FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    address {Faker::Address.street_address}
    email {Faker::Internet.email }
    password {"please123"}

    trait :admin do
      role 'admin'
    end

  end
end
