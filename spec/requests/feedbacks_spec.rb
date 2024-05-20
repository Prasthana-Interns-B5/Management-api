# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feedbacks', type: :request do
  let!(:employee1) do
    create :employee, name: 'employee', email: 'employee@gmail.com', role: 'ur_hr', password: '123456'
  end

  before(:each) do
    sign_in(employee1)
    Current.employee = employee1
  end

  let(:feedback1) { create :feedback, feedback_type: 'team feedback', employee_feedback: 'this is team feedback' }

  describe 'GET /index' do
    it 'will get all records' do
      get '/feedbacks'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    let(:valid_params) do
      { feedback: { feedback_type: 'company feedback', employee_feedback: 'this is employee feedback' } }
    end
    it 'will create the record' do
      expect do
        post '/feedbacks', params: valid_params
      end.to change(Feedback, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  describe 'PUT /update' do
    let(:valid_params) { { feedback: { feedback_type: 'company feedback' } } }
    it 'will update the record' do
      patch "/feedbacks/#{feedback1.id}", params: valid_params
      feedback1.reload
      expect(feedback1.feedback_type).to eq('company feedback')
      expect(response).to have_http_status(200)
    end
  end
end
