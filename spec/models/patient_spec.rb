require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "associations" do
    subject { create(:patient) }

    it "returns doctors list though appointments" do
      appointment = create(:appointment, patient: subject)

      expect(subject.doctors).to_not be_empty
      expect(subject.doctors).to include(appointment.doctor)
    end
  end
end
