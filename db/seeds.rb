# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

patient = Patient.create!(
  phone: "0990099900",
  password: "welcome",
  password_confirmation: "welcome",
  full_name: "Jack F"
)

5.times do
  Category.create!(
    title: Faker::Fantasy::Tolkien.character
  )
end

Doctor.create!(
  phone: "1234567890",
  password: "welcome",
  password_confirmation: "welcome",
  category_id: Category.last.id,
  full_name: Faker::Name.name_with_middle
)

3.times do |i|
  Doctor.create!(
    phone: "077007770#{i}",
    password: "welcome",
    password_confirmation: "welcome",
    category_id: Category.ids.sample,
    full_name: Faker::Name.name_with_middle
  )
end

10.times do
  Appointment.create!(
    patient_id: patient.id,
    doctor_id: Doctor.ids.sample
  )
end
