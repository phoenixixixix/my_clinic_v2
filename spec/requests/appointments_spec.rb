require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "GET /index" do
    it "displays appointments list" do
      sign_in create(:patient)

      get "/appointments"

      expect(response.body).to include("Your appointments")
    end
  end

  describe "POST /create" do
    let(:doctor) { create(:doctor) }
    let(:patient) { create(:patient) }

    before do
      sign_in patient
    end

    it "creates a new Appointment" do
      expect {
        post "/appointments", params: { appointment: { doctor_id: doctor.id }  }
      }.to change { Appointment.count }.by(1)
    end

    it "redirects to the root path" do
      post "/appointments", params: { appointment: { doctor_id: doctor.id }  }

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include("Appointment created!")
    end

    it "creates appointment with specified doctor" do
      target_name = "Target Full Name"
      doctor.update(full_name: target_name)

      post "/appointments", params: { appointment: { doctor_id: doctor.id }  }

      follow_redirect!
      expect(response.body).to include(target_name)
    end

    it "creates appointment with active status" do
      post "/appointments", params: { appointment: { doctor_id: doctor.id }  }

      expect(Appointment.last.status).to eq("active")
    end

    context "when user not signed in" do
      before do
        sign_out patient
      end

      it "doesn't create record" do
        expect {
          post "/appointments", params: { appointment: { doctor_id: doctor.id }  }
        }.to change { Appointment.count }.by(0)
      end
    end
  end

  describe "PATCH /update" do
    let!(:doctor) { create(:doctor) }
    let!(:appointment) { create(:appointment, doctor: doctor) }

    before do
      sign_in doctor
    end

    it "sets status to closed if conclusion present" do
      patch appointment_path(appointment), params: { appointment: { conclusion: "Added" } }

      appointment.reload
      expect(appointment.status).to eq("closed")
    end
  end
end
