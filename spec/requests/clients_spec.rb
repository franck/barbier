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
    
  end
  
  
end
