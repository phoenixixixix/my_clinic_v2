require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /index" do
    it "displays doctors list ordered by full_name ascending" do
      sign_in create(:patient)

      get "/doctors"

      expect(response.body).to include("Doctors")
    end
  end
end
