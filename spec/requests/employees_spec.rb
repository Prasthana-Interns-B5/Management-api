# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees', type: :request do
  let(:employee1) { create :employee, name: 'hr1', role: 'HR', email: 'hr11@gmail.com', password: '123456' }
  let!(:employee2) { create :employee, name: 'mr1', role: 'manager', email: 'mr1@gmail.com', password: '123456' }

  before(:each) do
    sign_in(employee1)
  end

  describe 'GET /employees' do
    it 'works! (now write some real specs)' do
      get '/employees'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /employees' do
    let(:valid_params) do
      { employee: { name: 'subordinate-1', role: 'subordinate', email: 'subordinate-1@gmail.com', password: '123456' } }
    end
    it 'creates a new resource' do
      expect do
        post '/employees', params: valid_params
      end.to change(Employee, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /employees/:id' do
    let(:employee4) do
      create :employee, name: 'john11', role: 'subordinate', email: 'john11@gmail.com', password: '123456'
    end
    it 'show the employee' do
      get "/employees/#{employee4.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /employees/:id' do
    let(:valid_params) { { employee1: { name: 'Updated Name' } } }
    it 'updates the employee' do
      patch "/employees/#{employee1.id}", params: { name: 'Updated Name' }
      employee1.reload
      debugger
      expect(employee1.name).to eq('Updated Name')
      expect(response).to have_http_status(200)
    end
  end

  describe 'Delete /employees/:id' do
    let(:employee4) do
      create :employee, name: 'john1', role: 'subordinate', email: 'john1@gmail.com', password: '123456'
    end
    it 'delete the employee' do
      delete "/employees/#{employee4.id}"
      expect(response).to have_http_status(204)
      expect(Employee.find_by(name: 'john1')).to be_nil
    end
  end
end
