require 'rails_helper'

RSpec.describe DeviceToken, type: :model do

  describe "creating device token" do
    let! (:employee1) {create :employee, name: "employee1", role: "ur_lead", password: 123456, email: "employee1@mail"}
   
    let! (:device_token1) {create:device_token, token: 898657678, device_type: "android", employee_id: employee1.id}
    it "valid token should be present" do
        expect(device_token1.valid?).to be(true)
    end

    it "valid device type" do
      expect(device_token1.device_type).to eq("android")
    end
  end

  describe 'device token checking' do
    let!(:employee2) {create :employee,name:'mr1',role:'ur_manager',email:'mr1@gmail.com',password:'123456' } 

    it 'token should be present' do
      device = DeviceToken.new(token: "12324", device_type: 'ios', employee_id: employee2.id).save
      expect(device).to eq(true) 
    end
  end
end
