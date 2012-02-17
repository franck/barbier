# encoding: UTF-8
require 'spec_helper'

describe "Photos" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Options'
    click_link 'Photos'
  end
  
  describe "#create" do
    context "when adding a photo" do
      it "display the thumb version on #index" do
        click_link 'Ajouter une photo'
      end
    end
    
    context "when photo is too big" do
      it "raises an error"
    end
    context "when photo is wrong format" do
      it "raises an error"
    end
  end
  
  describe "#destroy" do
    it "remove the photo and thus the thumbnail"
  end
  
  
    
end