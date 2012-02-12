require 'spec_helper'

module Options
  describe SauvegardesController do

    before(:each) do
      @salon = create(:salon)
      request.host = "#{@salon.subdomain}.test.com"
    end

    describe "GET 'export'" do
      it "returns http success" do
        get 'export'
        controller.stub!(:render)
        response.should be_success
      end
    end

  end
end