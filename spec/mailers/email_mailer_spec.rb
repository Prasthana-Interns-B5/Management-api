require "rails_helper"

RSpec.describe EmailMailer, type: :mailer do
  describe "signup email" do
    let! (:mail) {EmailMailer.signup_email("manager1@gmail")}
    it "mail details" do
      expect(mail.to).to eq(["manager1@gmail"])
      expect(mail.subject).to match("Signup mail")
      expect(mail.from).to eq(["apimanagement23@gmail.com"])
    end

    it "encode body" do
      expect(mail.body.encoded).to match("manager1@gmail")
    end
  end

  describe "generate otp mail" do
    let!(:otp) {'345654'}
    let!(:mail) {EmailMailer.otp_email('mr1@gmail.com', otp)}
    it "renders the headers" do
      expect(mail.to).to eq(["mr1@gmail.com"])
      expect(mail.subject).to match("OTP FOR LOGIN")
      expect(mail.from).to eq(["apimanagement23@gmail.com"])
    end
    it "renders the body" do
      expect(mail.body.encoded.length).to match(6)
    end
  end
end

