# encoding: UTF-8
require 'spec_helper'

describe "Informations" do
  
  before(:each) do
    create(:salon)
    set_host('barbier.test.com')
    visit '/prive'
    click_link 'Options'
    click_link 'Informations'
  end
  
  context "" do
    it ""
  end
  
    
end