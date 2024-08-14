require 'rails_helper'

RSpec.describe Item, type: :model do
    before(:each) do
      @item = FactoryBot.create(:item)
    end



  describe "item name test" do
    it "is not name none NG" do
      @item.name = ""
      expect(@item).to be_invalid
    end

    it "is length 51 over NG" do
      @item.name = "a" * 51
      expect(@item).to be_invalid
    end

    it "is length 50 OK" do
      @item.name = "a" * 50
      expect(@item).to be_valid
    end
  end

  describe "item stock test" do

    it "is not stock none NG" do
      @item.stock = ""
      expect(@item).to be_invalid
    end

    it "is stock number OK" do
      @item.stock = 6
      expect(@item).to be_valid
    end

    it "is not stock Not number NG" do
      @item.stock = "over"
      expect(@item).to be_invalid
    end

    it "is stock - NG" do
      @item.stock = -10
      expect(@item).to be_invalid
    end

    it "is stock flow OK" do
      @item.stock = 8.56
      expect(@item).to be_valid
    end
  end

  describe "item days test" do

    it "is days none NG" do
      @item.days = ""
      expect(@item).to be_invalid
    end

    it "is days in numbers OK" do
      @item.days = 30
      expect(@item).to be_valid
    end

    it "is days in Not numbers NG" do
      @item.days = "ov"
      expect(@item).to be_invalid
    end


    it "is days in - NG" do
      @item.days = -10
      expect(@item).to be_invalid
    end
  end

  describe "item user_id test" do
    it "is not include user_id NG " do
      @user = @item.user
      @user.id = ""
      @item.user = @user
      expect(@item).to be_invalid
    end
  end

  describe "item main_category" do
    it "is not include main_categroy OK" do
      @main_category = @item.main_category
      @main_category.name = ""
      @item.main_category = @main_category
      expect(@item).to be_valid
    end

  end
end
