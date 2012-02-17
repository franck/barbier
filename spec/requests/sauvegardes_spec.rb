# encoding: UTF-8
require 'spec_helper'

describe "Sauvegardes" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Options'
  end
    
    
end