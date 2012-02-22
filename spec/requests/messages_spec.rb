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
  
  describe "with facebook" do

    context "if no account" do
      before(:each) do
        click_link 'Messages'
        click_link 'Nouveau message'
      end
      
      it "shows checkbox publish to facebook account but disabled" do
        page.should have_content("Publier sur le compte Facebook")
        page.find('#message_publish_on_facebook_account')['disabled'].should == "disabled"
      end
      it "shows checkbox publish to facebook page but disabled" do
        page.should have_content("Publier sur la page Facebook")
        page.find('#message_publish_on_facebook_page')['disabled'].should == "disabled"
      end
    end
    
    context "if an account without page" do
      before(:each) do
        @facebook_account = create(:facebook_account, :salon_id => @salon.id)
        click_link 'Messages'
        click_link 'Nouveau message'
      end
      it "shows checkbox publish to facebook account and facebook account name" do
        page.should have_content("Publier sur le compte Facebook : Franck D'agostini")
        page.find('#message_publish_on_facebook_account')['disabled'].should be_nil
      end
      it "shows checkbox publish to facebook page but disabled" do
        page.should have_content("Publier sur la page Facebook")
        page.find('#message_publish_on_facebook_page')['disabled'].should == "disabled"
      end
    end
    
    context "if an account with page" do
      before(:each) do
        @facebook_account = create(:facebook_account_with_page, :salon_id => @salon.id)
        click_link 'Messages'
        click_link 'Nouveau message'
      end
      it "shows checkbox publish to facebook page and page name" do
        page.should have_content("Publier sur la page Facebook : Barbier du moulin")
        page.find('#message_publish_on_facebook_account')['disabled'].should be_nil
      end
    end
    
    
  end
  
  describe "with SMS" do
    
  end
  
  
    
end