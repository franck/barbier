# encoding: UTF-8
require 'spec_helper'

describe "Parametres" do
  
  before(:each) do
    create(:salon)
    set_host('barbier.test.com')
    visit '/prive'
    click_link 'Options'
  end
  
  describe "#update" do
    context "when changing name" do
      it "displays the new name on top" do
        fill_in 'salon_name', :with => "Bob de Brest"
        click_button('Enregistrer')
        within(".navbar") do
          page.should have_content("Bob de Brest")
        end
      end
    end
  end
  
    
end