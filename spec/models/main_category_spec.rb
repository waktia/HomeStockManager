require 'rails_helper'

RSpec.describe MainCategory, type: :model do

  before(:each) do
    @user = User.create(
      name: "Mike",
      email: "test@test.com",
      password: "foofoo",
      password_confirmation: "foofoo"
    )
    @user.save

    @main_category = MainCategory.create(
      name: "sample",
      user: @user
    )


  end

  describe "main_category name test" do
    it "is blank name NG" do
      @main_category.name = ""
      expect(@main_category).to be_invalid
    end


    it "is name length 51 NG" do
      @main_category.name = "a"*51
      expect(@main_category).to be_invalid
    end

    it "is name length 50 OK" do
      @main_category.name = "a"*50
      expect(@main_category).to be_valid
    end

  end

  describe "main_category user_id test" do
    it "is user_id blank NG" do
      @user.id = ""
      @main_category.user = @user
      expect(@main_category).to be_invalid
    end
  end
end
