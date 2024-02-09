FactoryBot.define do
  factory :user do
    phone { Faker::PhoneNumber.phone_number }
    full_name { "Dany Schweppes" }
    password { "Welcome" }
  end
end
