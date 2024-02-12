FactoryBot.define do
  factory :category do
    title { Faker::Fantasy::Tolkien.character }
  end
end
