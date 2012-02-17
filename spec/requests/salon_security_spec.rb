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
        click_button 'Me connecter'
        page.should have_content('Clients')
      end
    end
    
    context "if wrong password" do
      it "raise an error" do
        visit '/prive/login'
        fill_in 'password', :with => 'badpassword'
        click_button 'Me connecter'
        page.should have_content('Mauvais mot de passe')
        page.should have_no_content('Clients')
      end
    end        
  end
  
  describe "going to login page while already logged in" do
    it "redirects to prive root" do
      log_salon
      visit '/prive/login'
      page.should have_content('Clients')
    end
  end
    
end