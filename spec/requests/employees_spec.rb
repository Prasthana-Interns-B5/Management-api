require 'rails_helper'

RSpec.describe "Employees", type: :request do

  let! (:employee1) {create:employee, name: "swathi",role: "ur_hr",email: "swathi@mail", password: 123456}
  let! (:manager1) {create:employee, name: "sagar", role: "ur_manager", email: "sagar@mail", password: 123456}


  before(:each) do
    sign_in(employee1)
  end

  describe "GET /employees" do
    it "mangers in company" do
      get "/employees"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /employees" do
    let (:valid_params) {{employee:{ name: "employee2",role: "ur_software_engineer",password: 123456, email: "employee2@mail"}}}
    
    it 'by hr' do
      post "/employees", params: valid_params
      employee_response = JSON.parse(response.body)["data"]["name"]
      expect(employee_response).to eq("employee2")
      expect(response).to have_http_status(201)
    end
  end

  describe "GET /employees/:id" do
    let (:employee4) {create:employee, name: "employee4", role: "ur_lead", email: "employee4@mail",password: 123456}
    it 'by hr' do
      get "/employees/#{employee4.id}"
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["role"]).to eq("ur_lead")
    end
  end

  describe "PATCH /employees/:id" do
    it 'by hr' do
      put "/employees/#{employee1.id}", params: {employee: {name: "swathi n"}}
      expect(response).to have_http_status(200)
    end
  end

  describe "Delete /employees/:id" do
    let(:employee4) {create:employee, name: "employee4",email: "employee@mail", password: 123456, role: "ur_lead"}
    it 'by hr' do
      delete "/employees/#{employee4.id}"
      expect(response).to have_http_status(200)
    end
  end

end
