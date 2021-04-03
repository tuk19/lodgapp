require 'rails_helper'

RSpec.describe "Lodgs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/lodg/index"
      expect(response).to have_http_status(:success)
    end
  end

end
