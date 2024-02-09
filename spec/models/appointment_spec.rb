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
end
