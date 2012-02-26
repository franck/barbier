# encoding: UTF-8
require 'spec_helper'

describe "Informations" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
    click_link 'Informations'
  end
  
  describe "#update" do
    it "just works" do
      fill_in 'salon_title', :with => "Salon de coiffure pour homme"
      fill_in 'salon_description', :with => "Bienvenue chez nous"
      fill_in 'salon_horaires', :with => "Ouvert toute la semaine de 9h à 20h"
      click_button 'Enregistrer'
      page.should have_content('Informations mises à jour')
    end    
  end
  
end