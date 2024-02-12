require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /index" do
    it "displays doctors list ordered by full_name ascending" do
      sign_in create(:patient)

      get "/doctors"

      expect(response.body).to include("Doctors")
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
