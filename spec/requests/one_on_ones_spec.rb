# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OneOnOnes', type: :request do
  let(:one_on_one) { create :one_on_one }
  describe 'GET /one_on_ones' do
    it 'index of one_on_one' do
      get '/one_on_one', params: { search: 'Archana' }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /one_on_ones/id' do
    let(:one_on_one1) do
      create :one_on_one, team: 'Team2', date: '2023/07/13', time: '10', notes: 'This is the first notes for team2'
    end
    it 'show method of one_on_one' do
      get "/one_on_one/#{one_on_one1.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /one_on_ones/id' do
    let(:one_on_one2) do
      create :one_on_one, team: 'Team3', date: '2023/07/15', time: '12', notes: 'This is the first notes for team3'
    end
    it 'update method of one_on_one' do
      patch "/one_on_one/#{one_on_one2.id}", params: { notes: 'This is updated notes for team3' }
      one_on_one2.reload
      expect(response).to have_http_status(200)
    end
  end

  let(:one_on_one3) do
    create :one_on_one, team: 'Team4', date: '2023/07/17', time: '2', notes: 'This is the first notes for team4'
  end

  describe 'DELETE /one_on_ones/id' do
    let(:one_on_one4) do
      create :one_on_one, team: 'Team4', date: '2023/07/17', time: '2', notes: 'This is the second notes for team4'
    end
    it 'delete method of one_on_one' do
      delete "/one_on_one/#{one_on_one4.id}"
      expect(response).to have_http_status(200)
    end
  end

  let(:employee1) { create :employee, email: 'archana@gmail.com', password: 'Archana@123', name: 'Archana' }

  before(:each) do
    sign_in(employee1)
    Current.employee = employee1
  end

  describe 'GET /one_on_ones/assigned_members' do
    it 'assigned members of an employee for one_on_one' do
      get '/one_on_one/assigned_members'
      expect(response).to have_http_status(200)
    end
  end
end
