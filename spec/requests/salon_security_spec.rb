# encoding: UTF-8
require 'spec_helper'

describe "Salon security" do
  
  before(:each) do
    @salon = create(:salon)
    set_host('barbier.test.com')
  end
  
  describe "visiting prive and not logged in" do
    
    it "display the login box" do
      visit '/prive/clients'
      page.should have_content("Barbier du moulin")
    end
    
    context "if correct password" do
      it "log in" do
        visit '/prive/login'
        fill_in 'password', :with => @salon.password
      end
    end
    
    context "if wrong password" do
      it "raise an error"
    end
        
  end
  
    
end