require 'rails_helper'

RSpec.describe ContentController, :type => :controller do

  describe "GET 'silver'" do
    it "returns http success" do
      get 'silver'
      expect(response).to be_success
    end
  end

  describe "GET 'gold'" do
    it "returns http success" do
      get 'gold'
      expect(response).to be_success
    end
  end

  describe "GET 'platinum'" do
    it "returns http success" do
      get 'platinum'
      expect(response).to be_success
    end
  end

end
