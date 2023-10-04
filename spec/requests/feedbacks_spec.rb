require 'rails_helper'

RSpec.describe "Feedbacks", type: :request do

  let!(:employee1) {create :employee,name: "employee1", email: "employee1@mail", role: "ur_hr", password:123456}
  before(:each) do
    sign_in(employee1)
    Current.employee = employee1
  end

  let! (:feedback1) {create:feedback, employee_feedback: "Good", feedback_type: "Company feedback"}

  describe "GET /index" do
    it "all records" do
      get "/feedbacks"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    let (:valid_params) {{feedback:{feedback_type: "company", employee_feedback: "Nice"}}}
    it "by employee" do
      expect {
        post "/feedbacks", params: valid_params
      }.to change(Feedback, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  describe "PUT /update" do
    it "of an employee" do
      put "/feedbacks/#{feedback1.id}", params: {feedback: {employee_feedback: "Good to work"}}
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /delete" do
    it "of an employee" do
      delete "/feedbacks/#{feedback1.id}"
      expect(response).to have_http_status(200)
    end
  end

end
