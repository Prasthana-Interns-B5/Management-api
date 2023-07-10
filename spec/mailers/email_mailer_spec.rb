require "rails_helper"

RSpec.describe EmailMailer, type: :mailer do
  describe "signup_email" do
    let!(:employee2) {create :employee,name:'mr1',role:'manager',email:'mr1@gmail.com',password:'123456' } 
    let(:mail) { EmailMailer.signup_email('mr1@gmail.com') }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup mail")
      expect(mail.to).to eq(["mr1@gmail.com"])
      expect(mail.from).to eq(["apimanagement23@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("mr1@gmail.com")
    end
  end

  describe "generate_otp" do 
    let(:otp) { '987654' }
    let(:mail) { EmailMailer.otp_email('mr1@gmail.com',otp) }
    it "renders the headers" do
      expect(mail.subject).to eq("OTP FOR LOGIN")
      expect(mail.to).to eq(["mr1@gmail.com"])
      expect(mail.from).to eq(["apimanagement23@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded.length).to eq(6)
    end
  end

end
