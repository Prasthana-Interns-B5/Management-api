# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Roles', type: :request do
  let(:role) { create :role }
  describe 'GET /roles' do
    it 'index of roles' do
      get '/roles'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /roles/id' do
    let(:role1) { create :role, role_name: 'HR' }
    it 'show method of roles' do
      get "/roles/#{role.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /roles/id' do
    let(:role2) { create :role, role_name: 'Teamlead' }
    it 'update method of role' do
      patch "/roles/#{role2.id}", params: { role_name: 'teamlead' }
      role.reload
      expect(response).to have_http_status(200)
    end
  end

  let(:role3) { create :role, role_name: 'teamlead' }

  describe 'DELETE /roles/id' do
    let(:role4) { create :role, role_name: 'subordinate' }
    it 'delete method of role' do
      delete "/roles/#{role3.id}"
      expect(response).to have_http_status(200)
    end
  end
end
