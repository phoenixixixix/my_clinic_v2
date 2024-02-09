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
end
