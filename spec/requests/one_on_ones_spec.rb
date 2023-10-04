require 'rails_helper'

RSpec.describe "OneOnOnes", type: :request do
  let! (:employee1) {create:employee, name: "Archana", email: "archana@mail.com", password: 123456, role: "ur_manager"}
  let! (:employee2) {create:employee, name: "employee2", email: "employee2@mail", password: 123456, role: "ur_lead", reporting_manager_id: 1}
  before(:each) do
    sign_in(employee1)
    Current.employee = employee1
  end

  let! (:one_on_one1) {create:one_on_one, member_id: employee2.id}

  describe "GET /one_on_ones" do
    it "index" do 
      get "/one_on_ones" 
      expect(response).to have_http_status(200) 
    end
  end

  describe "GET /one_on_ones/id/reviews" do
    it "reviews action" do
      get "/one_on_ones/#{one_on_one1.id}/reviews"
      expect(response).to have_http_status(200)
    end
  end


  describe "POST /one_on_ones" do   
    let (:valid_params) {{one_on_one: {member_id: employee2.id}}}
    it "one_on_one" do
      post "/one_on_ones", params: valid_params
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /one_on_ones/id" do
    it "date" do
      put "/one_on_ones/#{one_on_one1.id}", params: {one_on_one: {date: "2023/09/29"}}
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /one_on_ones/id" do
    it "of an employee" do
      delete "/one_on_ones/#{one_on_one1.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /one_on_ones/assigned_members" do
    it "created by manageer" do
      get "/one_on_ones/meetings"
      expect(response).to have_http_status(200)
    end
  end

end
