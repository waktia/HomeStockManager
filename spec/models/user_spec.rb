require 'rails_helper'

RSpec.describe User, type: :model do


  describe "user name test" do
    it "is not name invalid" do
      user = FactoryBot.create(:user)
      user.name = ""
      expect(user).to be_invalid
    end

    it "is name length limit" do
      user = FactoryBot.create(:user)
      user.name = "a"*51
      expect(user).to be_invalid
    end

    it "is name length limit ok" do
      user = FactoryBot.create(:user, name: "a"*50)
      expect(user).to be_valid
    end
  end


  describe "user email test" do
    it "is not email invalid" do
      user = FactoryBot.create(:user)
      user.email = ""
      expect(user).to be_invalid
    end

    it "is email length limit" do
      user = FactoryBot.create(:user)
      user.email = "a"*247 +"@test.com"
      expect(user).to be_invalid
    end

    it "is email length limit ok" do
      user = FactoryBot.create(:user, email:  "a"*246 +"@test.com")
      expect(user).to be_valid
    end

    it "is email uniqueness" do
      user = FactoryBot.create(:user)
      other_user = user.dup

      expect(other_user).to be_invalid
    end
  end

  describe "user password test" do
    it "password should be present " do
      user = FactoryBot.create(:user)
      user.password = user.password_confirmation = " "*6
      expect(user).to be_invalid
    end

    it "password should have a minimum length" do
      user = FactoryBot.create(:user)
      user.password = user.password_confirmation = "a" *5
      expect(user).to be_invalid
    end

  end

end
