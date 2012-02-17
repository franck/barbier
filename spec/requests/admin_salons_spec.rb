# encoding: UTF-8
require 'spec_helper'

describe "Salons" do
  
  before(:each) do
    set_host("test.com")
  end
  
  describe "#create" do
    
    before(:each) do 
      visit '/admin'
      click_link 'Nouveau salon'
    end
    
    context "when nothing missing" do
      it "creates a salon" do
        fill_in 'salon_name', :with => "Barbier du moulin"
        fill_in 'salon_subdomain', :with => "barbier"
        fill_in 'salon_password', :with => "foobar"
        fill_in 'salon_password_confirmation', :with => "foobar"
        click_button 'Ajouter'
        page.should have_content('Salon ajouté')
      end
    end
    
    context "when no name" do
      it "raises an error" do
        fill_in 'salon_name', :with => ""
        fill_in 'salon_subdomain', :with => "barbier"
        click_button 'Ajouter'
        page.should have_content('Le nom du salon est obligatoire')
        page.should have_no_content('Salon ajouté')
      end
    end
    
    context "when no subdomain" do
      it "raises an error" do
        fill_in 'salon_name', :with => "Barbier du moulin"
        fill_in 'salon_subdomain', :with => ""
        click_button 'Ajouter'
        page.should have_content('Le sous domaine est obligatoire')
        page.should have_no_content('Salon ajouté')
      end
    end
    
    context "when subdomain is already taken" do
      it "raise an error" do
        create(:salon, :subdomain => 'barbier')
        fill_in 'salon_name', :with => "Barbier du moulin"
        fill_in 'salon_subdomain', :with => "barbier"
        click_button 'Ajouter'
        page.should have_content('Le sous domaine est déjà pris')
        page.should have_no_content('Salon ajouté')
      end
    end
    
    context "when subdomain as wrong format" do
      it "raise an error" do
        fill_in 'salon_name', :with => "Barbier du moulin"
        fill_in 'salon_subdomain', :with => "Barbier"
        click_button 'Ajouter'
        page.should have_content("Le sous domaine ne doit comporter que des lettres")
        page.should have_no_content('Salon ajouté')
      end
    end 
  end
  
  describe "#update" do
    
    before(:each) do 
      create(:salon, :subdomain => 'barbier')
      visit '/admin'
      click_link 'modifier'
    end
    
    context "when nothing missing" do
      it "update the salon" do
        fill_in 'salon_name', :with => "Bob de Brest"
        fill_in 'salon_subdomain', :with => "bob"
        click_button 'Modifier'
        page.should have_content("Bob de Brest")
        page.should have_content("bob")
      end  
    end
    
  end
  
  
end