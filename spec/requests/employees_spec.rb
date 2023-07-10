require 'rails_helper'

RSpec.describe "Employees", type: :request do

  let(:employee1) { create :employee, email: 'archana@gmail.com', password: 'Archana@123', name: "Archana" } 

  before(:each) do
    sign_in(employee1)
    Current.employee = employee1
  end

  describe "GET /employees" do
    it "works!" do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end

  describe "get /employees/assigned_members" do
    it "assigned members of an employee" do
      get '/employees/assigned_members'
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /employees/assigned_manager' do
    it 'assigned manager of the employee' do
      get "/employees/assigned_manager"
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /employees/assigned_subordinate' do
    it 'assigned subordinate of the employee' do
      get "/employees/assigned_subordinate"
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /employees/assigned_teamlead' do
    it 'assigned manager of the teamlead' do
      get "/employees/assigned_teamlead"
      expect(response).to have_http_status(200)
    end
  end

  describe 'get /employees/assigned_roles' do
    it 'assigned roles of the employee' do
      get "/employees/roles"
      expect(response).to have_http_status(200)
    end
  end

end
