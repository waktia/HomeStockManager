require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "/help" do
    it "responds successfully" do
      get :help
      expect(response).to be_successful
    end
  end

end
