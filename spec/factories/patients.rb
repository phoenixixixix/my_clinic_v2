FactoryBot.define do
  factory :patient do
    phone { Faker::PhoneNumber.phone_number }
    full_name { "Dany Patient" }
    password { "welcome" }
  end
end
