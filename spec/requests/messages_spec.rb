# encoding: UTF-8
require 'spec_helper'

describe "Messages" do
  
  before(:each) do
    @salon = create(:salon)
    set_host("#{@salon.subdomain}.test.com")
    log_salon
    visit '/prive'
    click_link 'Site'
    click_link 'Messages'
  end
  
  describe "#create" do
    context "when nothing is missing" do
      it "creates a message"
    end
    context "when title is missing" do
      it "raises an error"
    end
  end
  
  describe "#update" do
    context "when nothing is missing" do
      it "updates the message"
    end
    context "when title is missing" do
      it "raises an error"
    end
  end
  
  describe "#destroy" do
    it "display a notice message"
  end
  
  
    
end