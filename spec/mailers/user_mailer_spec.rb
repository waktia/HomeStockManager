require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    user = User.new(
      name: "sample",
      email: "tagtag@tag.com",
      password: "tagtag",
      password_confirmation: "tagtag"
    )

    before do
      # 手動でactivation_tokenとactivation_digestを設定
      user.activation_token = User.new_token
      user.activation_digest = User.digest(user.activation_token)
    end

    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["tagtag@tag.com"])
      expect(mail.from).to eq(["homestockmanager.send@gmail.com"])
    end

    # it "renders the body" do
    #   expect(mail.body.encoded).to match("Hi")
    # end

    it "includes the activation link in the email body" do
      expect(mail.body.encoded).to include(edit_account_activation_path(user.activation_token, email: user.email))
    end


    it "reminds the user of the registered email address" do
      mail.body.parts.each do |part|
        decoded_body = part.decoded
        if decoded_body.include?(CGI.escape(user.email))
          expect(decoded_body).to include(CGI.escape(user.email))
        else
          expect(decoded_body).to include(user.email)
        end
      end
    end

  end

  # describe "password_reset" do
  #   let(:mail) { UserMailer.password_reset }

  #   it "renders the headers" do
  #     expect(mail.subject).to eq("Password reset")
  #     expect(mail.to).to eq(["to@example.org"])
  #     expect(mail.from).to eq(["from@example.com"])
  #   end

  #   it "renders the body" do
  #     expect(mail.body.encoded).to match("Hi")
  #   end
  # end

end
