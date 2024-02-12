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

  describe "validations" do
    describe "appointment limit for 1 doctor" do
      it "fails to create new appointment for doctor with 10 ACTIVE appointments" do
        doctor = create(:doctor)
        10.times{ create(:appointment, doctor: doctor, status: :active) }

        appointment_11 = build(:appointment, doctor: doctor)

        expect(appointment_11).to be_invalid
        appointment_11.save
        expect(appointment_11.errors.full_messages).to include("This doctor reached limit of active appointments (10)")
      end

      it "creates the Appointment for doctor with LESS than 10 active appointments" do
        doctor = create(:doctor)
        10.times{ create(:appointment, doctor: doctor, status: :closed) }

        appointment_11 = build(:appointment, doctor: doctor)

        expect(appointment_11).to be_valid
        expect { appointment_11.save }.to change { Appointment.count }.by(1)
      end
    end
  end
end
