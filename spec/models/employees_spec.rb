require 'rails_helper'

RSpec.describe Employee, type: :model do

  context "creating first employee" do
    let(:employee) {create :employee, name: "employee1", role: "ur_hr", password: 123456, email: "employee1@mail", employee_no: "2023-09"}
    it "should be valid" do
      expect(employee.valid?).to be(true)
    end

    it "should have role" do
      expect(employee.role).to eq("ur_hr")
    end 

    it "should have employee no" do
      expect(employee.employee_no).to eq("2023-09")
    end
  end

end



