FactoryBot.define do
  factory :appointment do
    patient
    doctor
    conclusion { "" }
  end
end
