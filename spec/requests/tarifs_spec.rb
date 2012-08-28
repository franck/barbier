# encoding: UTF-8
require 'spec_helper'

describe "Tarifs" do
  
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

  describe "on index", :focus do

    it "adds a categories in the tarifs table" do
      click_link 'Tarifs'
      click_link 'Nouvelle catégorie'
      fill_in 'tarif_category_name', :with => 'Coiffure'
      click_button 'Ajouter'
      within("table#tarifs") do
        page.should have_content('Coiffure')
      end
    end

    context "when a category exists and a tarif is inside" do
      before(:each) do
        @tarif_category = create(:tarif_category, :name => "Coiffure cat", :salon_id => @salon.id)
        create(:tarif, :title => "Coiffure homme", :salon_id => @salon.id, :tarif_category_id => @tarif_category.id)
        click_link 'Tarifs'
      end

      it "edits a categorie" do
        within('tr.tarif_category') do
          click_link 'modifier'
        end
        fill_in 'tarif_category_name', :with => "Estetique"
        click_button 'Modifier'
        page.should have_no_content('Coiffure cat')
        page.should have_content('Estetique')
      end

      it "destroy a categorie and remove the category from the tarifs inside it" do
        # save_and_open_page
        within('tr.tarif_category') do
          click_link 'supprimer'
        end
        page.should have_no_content("Coiffure cat")
        page.should have_content("Coiffure homme")
      end

    end
  end

  describe "with categories" do
    
    before(:each) do
      create(:tarif, :title => "Coiffure homme", :salon_id => @salon.id)
      create(:tarif, :title => "Barbe", :salon_id => @salon.id)
      create(:tarif_category, :name => "Coiffure cat", :salon_id => @salon.id)
      click_link 'Tarifs'
      click_link 'modifier'
    end

    it "sets a category" do
      select 'Coiffure', :from => 'tarif_tarif_category_id' 
      click_button 'Modifier'
      page.should have_content('Barbe')
      within("td.tarif_title") do
        page.should have_content('Coiffure homme')
        page.should have_no_content('Barbe')
      end
    end
  end
  
end
