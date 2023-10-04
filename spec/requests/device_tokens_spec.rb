require 'rails_helper'

RSpec.describe "DeviceTokens", type: :request do
  let!(:employee1) {create :employee,name: "employee2", role: "ur_hr", email: "employee2@mail", password: 123456}
  before(:each) do 
    sign_in(employee1)
    Current.employee = employee1
  end

  context "CREATE /employees" do 
    it "android and ios" do
      post "/device_tokens", params: {device_token: {device_type: "android", token: 324566}}
      expect(response).to have_http_status(200)
      puts response.body
    end
  end

  let! (:device_token) {create :device_token, device_type: "ios", token: 2324435, employee_id: employee1.id}
  context "GET /device_tokens" do
    it "for an employee" do 
      get "/device_tokens"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "with id" do
      get "/device_tokens/#{device_token.id}"
      expect(response).to have_http_status(200)
    end
  end
end
