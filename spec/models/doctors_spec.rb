require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "associations" do
    subject { create(:doctor) }

    it "returns patients list though appointments" do
      appointment = create(:appointment, doctor: subject)

      expect(subject.patients).to_not be_empty
      expect(subject.patients).to include(appointment.patient)
    end
  end

  describe "appointments count" do
    it "increases number by 1 on appointment creation" do
      doctor = create(:doctor)

      expect {
        create(:appointment, doctor: doctor)
      }.to change { Doctor.last.appointments.size }.by(1)
    end
  end
end
