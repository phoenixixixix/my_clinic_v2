require 'rails_helper'

RSpec.describe User, type: :model do
  describe "type" do
    describe "Patient" do
      it "creates new Patient under user table" do
        last_patient = Patient.create(attributes_for(:user))

        expect(User.last).to eq(last_patient)
      end
    end

    describe "Doctor" do
      it "creates new Patient under user table" do
        last_doc = Doctor.create(attributes_for(:user))

        expect(User.last).to eq(last_doc)
      end
    end
  end
end
