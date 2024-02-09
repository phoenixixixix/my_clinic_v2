FactoryBot.define do
  factory :doctor do
    phone { Faker::PhoneNumber.phone_number }
    full_name { "Dany Doctor" }
    password { "welcome" }
  end
end
