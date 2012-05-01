# encoding: UTF-8
require 'spec_helper'

describe "Tarif Categories" do

  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
  end

  context "when two categories" do

    before(:each) do
      @cat1 = create(:tarif_category, :name => "Coiffure cat", :salon_id => @salon.id)
      @cat2 = create(:tarif_category, :name => "Massage cat", :salon_id => @salon.id)
      click_link 'Tarifs'
    end

    it "sorts the categories" do
      click_link 'Trier les catégories'
      # sort in JS
      click_link "J'ai fini de trier"
      within("h1") do
        page.should have_content("Tarifs")
      end
    end

  end

end
