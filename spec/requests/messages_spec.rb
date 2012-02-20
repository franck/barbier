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
      click_link 'Messages'
      click_link 'Nouveau message'
    end
    
    context "when nothing is missing" do
      it "creates a message" do
        fill_in 'message_title', :with => "Un titre de message"
        fill_in 'message_content', :with => "Un contenu pour le message"
        click_button 'Ajouter'
        page.should have_content('Message ajouté')
        page.should have_content('Un titre de message')
      end
    end
    context "when title is missing" do
      it "raises an error" do
        click_button 'Ajouter'
        page.should have_content('Le titre est obligatoire')
      end
    end
  end
  
  describe "#update" do
    before(:each) do
      message = create(:message, :salon_id => @salon.id)
      click_link 'Messages'
      click_link('modifier')
    end
    
    context "when nothing is missing" do  
      it "updates the message" do
        fill_in 'message_title', :with => "Un autre titre de message"
        click_button 'Modifier'
        page.should have_content('Message modifié')
        page.should have_content('Un autre titre de message')
      end
    end
    context "when title is missing" do
      it "raises an error" do
        fill_in 'message_title', :with => ""
        click_button 'Modifier'
        page.should have_content('Le titre est obligatoire')
      end
    end
  end
  
  describe "#destroy" do
    before(:each) do
      message = create(:message, :salon_id => @salon.id)
      click_link 'Messages'
      click_link('supprimer')
    end

    it "display a notice message" do
      page.should have_content('Message supprimé')
    end
  end
  
  
    
end