require 'rails_helper'

RSpec.describe "EmployeeSignUp", type: :request do
  describe "POST /employees/create_first_employee" do
    let (:valid_params) {{employee: {name: "swathi", email: "swath@mail", password: 123456, role: "ur_hr"}}}
     it "of hr" do
        post "/employees/create_first_employee", params: valid_params
        expect(response).to have_http_status(201)
        expect(Employee.count).to eq(1)
     end
  end

  describe "POST /employees/create_first_employee" do
    let! (:employee2) {create:employee,name:'mr1',role:'ur_manager',email:'mr1@gmail.com',password:'123456' }
    let (:valid_params) {{employee: {name: "swath@123", email: "swathi@mail", password: 123456, role: "ur_hr"}}}
    it "handling unauthorized" do
      post "/employees/create_first_employee", params: valid_params
      expect(response).to have_http_status(422)
      puts response.body
    end
  end

  describe "POST /employees/generate_otp" do
    let! (:employee2) {create :employee, name: "employee2", email: "employee2@mail", password: 123456, role: "ur_hr"}
    it "of an employee" do
      post "/employees/generate_otp", params: {employee: {email: "employee2@mail"}}
      expect(response).to have_http_status(200)
    end
  end

end
