# encoding: UTF-8
require 'spec_helper'

describe "Salons" do
    
  describe "on main domain" do
    it "should show a splash screen" do
      set_host("test.com")
      visit '/'
      page.should have_content("Coming soon")
    end
  end
    
  describe "on subdomain" do
    context "when subdomain exist" do
      it "show the salon" do
        create(:salon)
        set_host("barbier.test.com")
        visit '/'
        page.should have_content("Barbier du moulin")
      end
    end  
  end
  
  describe "on a another domain" do
    context "when domain exist" do
      it "show the salon" do
        create(:salon, :domain => 'barbier-du-moulin.com')
        set_host("barbier-du-moulin.com")
        visit '/'
        page.should have_content("Barbier du moulin")
      end
    end
  end
  
end