FactoryGirl.define do
  factory :dog do
    name {Faker::Name.name}
    breed {Faker::Hacker.adjective}
    registered_until {Date.today + 6.months}
    date_of_birth {"2015-01-01"}
  end

end
