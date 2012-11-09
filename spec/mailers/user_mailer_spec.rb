require "spec_helper"

describe UserMailer do
  describe "confirm_active" do
    let(:mail) { UserMailer.confirm_active }

    it "renders the headers" do
      mail.subject.should eq("Welcome to the Carrier Site")
      # mail.to.should eq(["to@example.org"])
      mail.from.should eq(["joshbegin@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hello")
    end
  end

  describe "admin_confirmation" do
    let(:mail) { UserMailer.admin_confirmation }

    it "renders the headers" do
      mail.subject.should eq("New user for Carrier Site")
      # mail.to.should eq(["to@example.org"])
      mail.from.should eq(["joshbegin@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hello")
    end
  end

end
