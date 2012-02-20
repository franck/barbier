# encoding: UTF-8
require 'spec_helper'

describe "Public Site" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/'
  end
  
  it "just work" do
    page.should have_content(@salon.name)
  end
    
    
end