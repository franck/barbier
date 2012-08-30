# encoding: UTF-8
require 'spec_helper'

describe "Produit Categories" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive/boutique'
  end

  context "on #create" do
    before(:each) do
      click_link 'Produits'
      click_link 'Nouvelle catégorie'
    end
    context "when nothing is missing" do
      before(:each) do
        fill_in 'produit_category_name', :with => "Shampoing"
        click_button 'Ajouter'
      end
      it "creates a product categorie" do
        page.should have_content "Shampoing"
      end
    end
    context "when something wrong" do
      before(:each) do
        fill_in 'produit_category_name', :with => ""
        click_button 'Ajouter'
      end
      it "raises an error" do
        page.should have_content "Il manque le nom de la catégorie"
      end
    end
  end

  context "on #update" do
    before(:each) do
      create(:produit_category, :salon_id => @salon.id)
      click_link 'Produits'
      click_link 'modifier'
    end
    context "when nothing is missing" do
      before(:each) do
        fill_in 'produit_category_name', :with => "Rasoirs"
        click_button 'Modifier'
      end
      it "updates the product categorie" do
        page.should have_content("Rasoirs")
      end
    end
  end

  context "on #destroy,", :focus => true do
    context "when a product is inside this category," do
      before(:each) do
        @category = create(:produit_category, :name => "Shampoings", :salon_id => @salon.id)
        create(:produit, :name => "Shampoing à la rose", :produit_category_id => @category.id, :salon_id => @salon.id)
        click_link 'Produits'
        within("tr.produit_category") do
          click_link 'supprimer'
        end
      end
      it "destroys the category" do
        page.should have_no_content("Shampoings")
        page.should have_content("Catégorie supprimée")
      end
      it "does not destroy the product" do
        page.should have_content("Shampoing à la rose")
      end
    end
  end


end
