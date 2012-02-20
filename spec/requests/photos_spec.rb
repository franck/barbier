# encoding: UTF-8
require 'spec_helper'

describe "Photos" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
    click_link 'Photos'
  end
  
  describe "#create" do
    
    before(:each) { click_link 'Ajouter une photo' }
    
    context "when adding a photo" do
      it "display the thumb version on #index" do
        attach_file "photo_picture", File.join(Rails.root, 'spec', 'support', 'photos', 'barbier.jpg' )
        click_button 'Ajouter'
        page.should have_content("supprimer")
      end
    end
    
    context "when file is missing" do
      it "raises an error" do
        click_button 'Ajouter'
        page.should have_content('Vous oubliez le fichier')
      end
    end
    context "when photo is too big" do
      it "raises an error" do
        attach_file "photo_picture", File.join(Rails.root, 'spec', 'support', 'photos', 'photo_too_big.jpg' )
        click_button 'Ajouter'
        page.should have_content('La photo est trop lourde (max 5Mo)')
      end
    end
    context "when photo is wrong format" do
      it "raises an error" do
        attach_file "photo_picture", File.join(Rails.root, 'spec', 'support', 'photos', 'photo.png' )
        click_button 'Ajouter'
        page.should have_content('La format du fichier est incorrect (JPG ou JPEG seulement)')
      end
    end
  end
  
  describe "#destroy" do
    it "remove the photo and thus the thumbnail" do
      photo = create(:photo, :salon_id => @salon.id)
      click_link 'Photos'
      click_link 'supprimer'
      page.should have_no_content('supprimer')
    end
  end
  
  
    
end