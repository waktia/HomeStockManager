require 'rails_helper'

RSpec.describe User, type: :model do

before(:each) do
  @user = User.create(
    name: "Mike",
    email: "test@test.com",
    password: "foofoo",
    password_confirmation: "foofoo"
  )
end


  describe "user name test" do
    it "is not name invalid" do
      @user.name = ""
      expect(@user).to be_invalid
    end

    it "is name length limit" do
      @user.name = "a"*51
      expect(@user).to be_invalid
    end

    it "is name length limit ok" do
      @user.name = "a"*50
      expect(@user).to be_valid
    end
  end


  describe "user email test" do
    it "is not email invalid" do
      @user.email = ""
      expect(@user).to be_invalid
    end

    it "is email length limit" do
      @user.email = "a"*247 +"@test.com"
      expect(@user).to be_invalid
    end

    it "is email length limit ok" do
      @user.email = "a"*246 +"@test.com"
      expect(@user).to be_valid
    end



    it "is email uniqueness" do
      other_user = @user.dup
      other_user.email = @user.email
      @user.save
      expect(other_user).to be_invalid
    end
  end

  describe "user password test" do
    it "password should be present " do
      @user.password = @user.password_confirmation = " "*6
      expect(@user).to be_invalid
    end

    it "password should have a minimum length" do
      @user.password = @user.password_confirmation = "a" *5
      expect(@user).to be_invalid
    end

  end

end
