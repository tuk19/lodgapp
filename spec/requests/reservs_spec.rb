require 'rails_helper'

RSpec.describe "Reservs", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/reservs/index"
      expect(response).to have_http_status(:success)
    end
  end

end
