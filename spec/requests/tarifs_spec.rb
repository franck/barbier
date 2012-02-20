# encoding: UTF-8
require 'spec_helper'

describe "Messages" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
  end
  
  describe "#create" do
    before(:each) do
      click_link 'Tarifs'
      click_link 'Nouveau tarif'
    end
    
    context "when nothing is missing" do
      it "creates the tarif" do
        fill_in 'tarif_title', :with => 'Coiffure homme'
        fill_in 'tarif_price', :with => '19,5'
        click_button 'Ajouter'
        page.should have_content('Tarif ajouté')
        page.should have_content('Coiffure homme')
        page.should have_content('19,50 €')
      end
    end
    context "when title is missing" do
      it "raises an error" do
        fill_in 'tarif_title', :with => ''
        fill_in 'tarif_price', :with => '19,5'
        click_button 'Ajouter'
        page.should have_content('Le titre du service ou du produit ne peut être vide')
      end
    end
    context "when price is missing" do
      it "raises an error" do
        fill_in 'tarif_title', :with => 'Coiffure homme'
        fill_in 'tarif_price', :with => ''
        click_button 'Ajouter'
        page.should have_content('Vous oubliez le prix')
      end
    end
    context "when price is not a number" do
      it "raises an error" do
        fill_in 'tarif_title', :with => 'Coiffure homme'
        fill_in 'tarif_price', :with => 'foo'
        click_button 'Ajouter'
        page.should have_content('Le prix doit être un nombre')
      end
    end
  end
  
  describe "#update" do
    before(:each) do
      create(:tarif, :salon_id => @salon.id)
      click_link 'Tarifs'
      click_link 'modifier'
    end
    context "when nothing is missing" do
      it "update the tarif" do
        fill_in 'tarif_title', :with => 'Barbe homme'
        fill_in 'tarif_price', :with => '40'
        click_button 'Modifier'
        page.should have_content('Tarif modifié')
        page.should have_content('Barbe homme')
        page.should have_content('40,00 €')
      end
    end
  end
  
  describe "#destroy" do
    before(:each) do
      create(:tarif, :salon_id => @salon.id)
      click_link 'Tarifs'
      click_link 'supprimer'
    end
    it "destroy the tarif" do
      page.should have_content('Tarif supprimé')
      page.should have_no_content('Coiffure homme')
    end
  end
  
end