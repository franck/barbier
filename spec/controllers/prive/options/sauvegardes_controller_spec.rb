require 'spec_helper'

module Prive::Options
  describe SauvegardesController do

    before(:each) do
      @salon = create(:salon)
      controller.stub(:authenticate)
      
      request.host = "#{@salon.subdomain}.test.com"
    end
    
    describe "GET index" do
      it "is a success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET export" do
      it "returns http success" do
        get 'export'
        controller.stub!(:render)
        response.should be_success
      end
    end

  end
end