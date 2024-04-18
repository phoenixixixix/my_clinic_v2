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
  phone: '0990099900',
  password: 'welcome',
  password_confirmation: 'welcome',
  full_name: 'Jack F'
)

3.times do |i|
  Category.create!(
    title: "Category #{i}"
  )
end

Doctor.create!(
  phone: '1234567890',
  password: 'welcome',
  password_confirmation: 'welcome',
  category_id: Category.last.id,
  full_name: 'John Jones'
)

3.times do |i|
  Doctor.create!(
    phone: "077007770#{rand(1000)}",
    password: 'welcome',
    password_confirmation: 'welcome',
    category_id: Category.ids.sample,
    full_name: "Lary Newman#{i}"
  )
end

10.times do
  Appointment.create!(
    patient_id: patient.id,
    doctor_id: Doctor.ids.sample
  )
end
