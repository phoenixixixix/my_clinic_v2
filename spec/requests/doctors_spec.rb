require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /index" do
    before do
      sign_in create(:patient)
    end

    it "displays doctors list ordered by full_name ascending" do
      get "/doctors"

      expect(response.body).to include("Doctors")
    end

    describe "Filtering" do
      it "lists doctors by category" do
        category = create(:category)
        target_doctor = create(:doctor, full_name: "Target", category: category)

        get "/doctors", params: { category: category.id }

        expect(response.body).to include(target_doctor.full_name)
      end

      it "lists all doctors if category not specified" do
        target_doctor = create(:doctor, full_name: "Target")

        get "/doctors", params: { category: "" }

        expect(response.body).to include(target_doctor.full_name)
      end
    end

    context "when doctor signed in" do
      it "doesn't list doctors" do
        sign_in create(:doctor)

        get doctors_path

        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body).to include("You are not authorized to perform this task")
      end
    end
  end
end
