FactoryBot.define do
  factory :user do
    phone { Faker::PhoneNumber.phone_number }
    full_name { "Dany Schweppes" }
    password { "Welcome" }

    trait :patient do
      type { "patient" }
    end

    trait :doctor do
      type { "doctor" }
    end
  end
end
