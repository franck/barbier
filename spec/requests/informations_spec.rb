# encoding: UTF-8
require 'spec_helper'

describe "Informations" do
  
  before(:each) do
    @salon= create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
    click_link 'Informations'
  end
  
  context "settings correct information" do
    before(:each) do
      fill_in 'salon_public_email', :with => 'contact@barbier.com'
      fill_in 'salon_phone', :with => '0310041568'
      fill_in 'salon_address', :with => '24 rue du moulin'
      fill_in 'salon_postalcode', :with => '08000'
      fill_in 'salon_city', :with => 'Charleville-Mézières'
      within('.contact') do
        click_button 'Enregistrer'
      end
    end
    
    it "display a notice message" do
      page.should have_content("Informations mises à jour")
    end
    
    it "display the information on public site" do
      visit '/'
      page.should have_content("Contact")
      page.should have_content("contact@barbier.com")
      page.should have_content("0310041568")
      page.should have_content("24 rue du moulin")
      page.should have_content("08000")
      page.should have_content("Charleville-Mézières")
    end
  end
  
  context "when email format is invalid" do
    it "raise an error" do
      fill_in 'salon_public_email', :with => 'contact.com'
      within('.contact') do
        click_button 'Enregistrer'
      end
      page.should have_content("Le format de l'email n'est pas bon")
    end
  end
  
    
end