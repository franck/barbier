# encoding: UTF-8
require 'spec_helper'

describe "Produits" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive/boutique'
  end
  
  describe "#create" do
    before(:each) do
      click_link 'Produits'
      click_link 'Nouveau produit'
    end

    context "when nothing is missing" do
      before(:each) do 
        fill_in 'produit_name', :with => 'Mousse a raser' 
        click_button 'Ajouter'
      end
      it "creates a product" do
        page.should have_content("Mousse a raser")
      end
    end
    context "when name is missing" do
      before(:each) do 
        click_button 'Ajouter'
      end
      it "raises an error" do
        page.should have_content("Il manque le nom du produit")
      end
    end
  end

  describe "#update" do
    context "when nothing is missing" do
      before(:each) do
        create(:produit, :salon_id => @salon.id)
        click_link 'Produits'
        click_link 'modifier'
        fill_in 'produit_name', :with => 'Shampoing' 
        click_button 'Modifier'
      end
      it "updates the product" do
        page.should have_content("Shampoing")
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      create(:produit, :salon_id => @salon.id)
      click_link 'Produits'
      click_link 'supprimer'
    end
    it "destroys the product" do
      page.should have_no_content("Mousse a raser")
    end
  end
end
