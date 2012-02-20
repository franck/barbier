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
  
  describe "#index" do
    it "display the default theme" do
      click_link 'Thèmes'
      page.should have_content('Thème par défaut')
    end
  end
  
  describe "#create" do
    before(:each) do
      click_link 'Thèmes'
      click_link 'Nouveau thème'
    end
    context "when nothing is missing" do
      it "creates the theme" do
        fill_in 'theme_title', :with => "Mon thème"
        click_button 'Ajouter'
        page.should have_content('Thème ajouté')
        page.should have_content('Mon thème')
      end
    end
    context "when title is missing" do
      it "raises an error" do
        fill_in 'theme_title', :with => ""
        click_button 'Ajouter'
        page.should have_content('Vous devez donner un titre à ce thème')
      end
    end
    
  end
  
  describe "#update" do
    before(:each) do
      create(:theme, :salon_id => @salon.id)
      click_link 'Thèmes'
      click_link 'modifier'
    end
    context "when nothing is missing" do
      it "creates the theme" do
        fill_in 'theme_title', :with => "Mon thème modifié"
        click_button 'Modifier'
        page.should have_content('Thème modifié')
        page.should have_content('Mon thème modifié')
      end
    end
  end
  
  describe "#destroy" do
    before(:each) do
      create(:theme, :salon_id => @salon.id)
      click_link 'Thèmes'
      click_link 'supprimer'
    end
    it "destroys the theme" do
      page.should have_no_content('Mon thème')
    end
  end
  
  describe "#use" do
    before(:each) do
      @theme = create(:theme, :salon_id => @salon.id)
      click_link 'Thèmes'
      within(".theme-#{@theme.id}") do
        click_link 'utiliser'
      end
    end
    it "activate the theme" do
      page.should have_content('Thème activé')
      within(".theme-#{@theme.id}") do
        page.should have_content('utilisé')
      end
    end
  end
  
  describe "#use_default" do
    before(:each) do
      @theme = create(:theme, :salon_id => @salon.id, :state => 'active')
      click_link 'Thèmes'
      within(".theme-default") do
        click_link 'utiliser'
      end
    end
    it "activate default theme" do
      page.should have_content('Thème activé')
      within(".theme-default") do
        page.should have_content('utilisé')
      end
    end
  end
  
  
end