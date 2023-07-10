require 'rails_helper'

RSpec.describe "EmployeeSignUp", type: :request do
  describe "POST /employee_sign_up/create_first_employee" do
    context 'first employee try to sign_up' do
    let(:valid_params) { { employee: {email:'subordinate-1@gmail.com',password:'123456',name: 'subordinate-1', role: 'subordinate'} } }
    it 'creates a first employee' do
        post '/employee_sign_up/create_first_employee', params: valid_params
        expect(Employee.count).to eq(1)
        expect(response).to have_http_status(201)
    end
  end

  describe "POST /employee_sign_up/create_first_employee" do
    let!(:employee2) {create :employee,name:'mr1',role:'manager',email:'mr1@gmail.com',password:'123456' } 
      let(:valid_params) { { employee: {email:'subordinate-1@gmail.com',password:'123456',name: 'subordinate-1', role: 'subordinate'} } }
      it 'creates a first resourse failed case' do
          post '/employee_sign_up/create_first_employee', params: valid_params
          expect(Employee.count).to eq(1)
          expect(response).to have_http_status(422)
      end
    end
  end


  describe "POST /employee_sign_up/generate_otp" do
   let!(:employee1) {create :employee,name:'mr1',role:'manager',email:'mr1@gmail.com',password:'123456789' } 
    let(:valid_params) { { employee: {email:'mr1@gmail.com'} } }
    it 'checks the updation of password' do
      post '/employee_sign_up/generate_otp', params: valid_params
      employee1.reload
      expect(response).to have_http_status(200)
    end
  end

end
