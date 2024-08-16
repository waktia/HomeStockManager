require 'rails_helper'

RSpec.describe "Items", type: :system do
  include LoginSupport

  before do
    driven_by(:rack_test)
  end

  scenario "user creates a new item" do
    user = FactoryBot.create(:user)
    log_in_as(user)

    expect {
      click_link "管理アイテム一覧ページ"
      fill_in "アイテム名", with: "シャンプー"
      fill_in "在庫の量(%)", with: 100
      fill_in "在庫を使い切る日数(日)", with: 30
      click_button "作成"

      expect(page).to have_current_path "/"

  }.to change(user.items, :count).by(1)
  end


end
