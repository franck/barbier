# encoding: UTF-8
require 'spec_helper'

describe "Clients" do
  
  describe "#create" do
    context "given valid information" do
      it "creates a client" do
        visit '/'
        click_link 'Nouveau client'
        fill_in :name, :with => 'Bob'
        click_button 'Ajouter'
        page.should have_content('Bob')
      end
    end
    
    context "when no name given" do
      it "display an error message" do
        visit '/'
        click_link 'Nouveau client'
        fill_in :name, :with => ''
        click_button 'Ajouter'
        page.should have_content('Il faut mettre un nom')
      end
    end
    
    context "setting birthdate" do
      it "creates a client" do
        visit '/'
        click_link 'Nouveau client'
        fill_in :name, :with => 'Bob'
        fill_in :birthdate, :with => '07/06/1978'
        click_button 'Ajouter'
        page.should have_content('07/06/1978')
      end
    end
  end
  
  describe "#index" do
    context "when more than 20 results" do
      before(:each){ 22.times { create(:client, :name => Faker::Name.name)} }
      it "paginate" do
        visit '/'
        within('.pagination') do
          page.should have_content('2')
        end
      end
    end
    
  end
    
end
