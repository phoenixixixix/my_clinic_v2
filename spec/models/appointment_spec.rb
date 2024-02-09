require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "associations" do
    subject { build(:appointment) }

    it "returns associated patient" do
      patient = create(:patient)

      subject.patient = patient

      expect(subject.patient).to eq(patient)
    end

    it "returns associated doctor" do
      doctor = create(:doctor)

      subject.doctor = doctor

      expect(subject.doctor).to eq(doctor)
    end
  end

  describe "status" do
    it "active when conclusion not present)" do
      appointment = create(:appointment)

      appointment.update(conclusion: "")

      expect(appointment.active?).to be_truthy
    end

    it "changes to closed when conclusion present" do
      appointment = create(:appointment)

      appointment.update(conclusion: "You alright")

      expect(appointment.closed?).to be_truthy
    end
  end

  describe "validation" do
    describe "appointments limit for 1 doctor" do
      it "fails to create new appointment for doctor with 10 appointments" do
        doctor = create(:doctor)
        10.times{ create(:appointment, doctor: doctor) }
        doctor.reload # sync counter cache value

        appointment_11 = build(:appointment, doctor: doctor)
        appointment_11.save

        expect(appointment_11).to be_invalid
        expect(appointment_11.errors.full_messages).to include("This doctor reached limit of active appointments (10)")
      end
    end
  end
end
