require 'rails_helper'

RSpec.describe User, type: :model do
  describe "type" do
    describe "Patient" do
      it "creates new Patient under user table" do
        create(:patient)

        expect(User.last.type).to eq("Patient")
      end
    end

    describe "Doctor" do
      it "creates new Doctor under user table" do
        create(:doctor)

        expect(User.last.type).to eq("Doctor")
      end
    end
  end
end
