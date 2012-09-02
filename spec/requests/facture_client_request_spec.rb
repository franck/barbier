# encoding: utf-8
require 'spec_helper'

describe "Facture client" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
  end

  context "on existing client sheet" do
    before(:each) do
      create(:client, :name => "Bob foo", :salon_id => @salon.id)
      visit '/prive/clients'
      click_link "Bob foo"
      within("#client") do
        click_link "Facture"
      end
    end
    
    it "raises an error if no date" do
      fill_in "facture_payed_at", :with => ""
      click_button "Ajouter"
      page.should have_content "Il manque la date de la facture" 
    end

    it "adds a bill with an item" do
      fill_in "facture[items_attributes][0][description]", :with => "Coiffure homme"
      fill_in "facture[items_attributes][0][price]", :with => "19"
      click_button "Ajouter"
      within("#factures") do
        page.should have_content "Coiffure homme"
        page.should have_content "19,00 €"
      end
    end

    it "adds a bill with an item without description" do
      fill_in "facture[items_attributes][0][price]", :with => "19"
      click_button "Ajouter"
      page.should have_content "Facture créée"
    end

    it "raises an error if the bill has no item" do
      fill_in "facture[items_attributes][0][price]", :with => ""
      click_button "Ajouter"
      page.should have_content "Un ou plusieurs services ne sont pas valides"
    end
  end

  context "on existing client sheet with a existing bill" do
    before(:each) do
      @bob = create(:client, :name => "Bob foo", :salon_id => @salon.id)
      @bill = create(:facture, :payed_at => "15/05/2012", :client_id => @bob.id, :salon_id => @salon.id, :items_attributes => { "123456" => { :price => "19" }} )
      visit '/prive/clients'
      click_link "Bob foo"
    end

    it "edit a bill" do
      within("#factures") do
        page.should have_content "15/05/2012"
        click_link "modifier"
      end
      page.should have_content "Modifier la facture"
      fill_in "facture[payed_at]", :with => "12/05/2012"
      click_button "Modifier"
      page.should have_content("Facture modifiée")
      within("#factures") do
        page.should have_no_content "15/05/2012"
        page.should have_content "12/05/2012"
      end
    end

    it "deletes a bill" do
      within("#factures") do
        click_link "supprimer"
      end
      page.should have_content "Facture supprimée"
    end
  end



end
