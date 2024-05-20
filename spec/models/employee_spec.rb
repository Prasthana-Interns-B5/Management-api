# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'creating an employee' do
    let(:employee) do
      create :employee, name: 'subordinate1', role: 'subordinate', email: 'subordinate@gmail.com', password: '123456'
    end

    it 'should validate emoloyee' do
      expect(employee.valid?).to eq(true)
    end
    it 'should have employee_no' do
      expect(employee.employee_no).to eq('2023-3')
    end
    it 'should have validate role' do
      expect(employee.role).to eq('subordinate')
    end
  end
end
