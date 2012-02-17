# encoding: UTF-8
require 'spec_helper'

describe "Parametres" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Options'
    click_link 'Paramètres'
  end
  
  describe "#update" do
    context "when changing name" do
      it "displays the new name on top" do
        fill_in 'salon_name', :with => "Bob de Brest"
        click_button('Enregistrer')
        within(".navbar") do
          page.should have_content("Bob de Brest")
        end
      end
    end
    
    context "when changing the subdomain" do
      it "redirects to the new subdomain" do
        fill_in 'salon_subdomain', :with => "bob"
        click_button('Enregistrer')
        current_url.should have_content("bob")
      end
    end
    
    context "when password is OK" do  
      it "change the password" do
        fill_in 'salon_password', :with => 'barfoo'
        fill_in 'salon_password_confirmation', :with => 'barfoo'
        click_button('Enregistrer')
        click_link("Se déconnecter")
        visit '/prive/login'
        fill_in 'password', :with => 'barfoo'
        page.should have_no_content("Mauvais mot de passe")
      end
    end
    
    context "when password is not OK" do
      it "raise an error" do
        fill_in 'salon_password', :with => 'ba'
        fill_in 'salon_password_confirmation', :with => 'ba'
        click_button('Enregistrer')
        page.should have_no_content("kvlDV")
      end
    end
    
  end
  
    
end