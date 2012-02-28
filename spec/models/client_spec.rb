# encoding: UTF-8
require 'spec_helper'

describe Client do
  
  it "set the birthdate with text" do
    client = Client.new(:name => 'Bob', :birthdate => '07/06/1978')
    client.birthdate.strftime('%d/%m/%Y').should == "07/06/1978"
    client.birthdate.strftime('%d/%m/%y').should == "07/06/78"
  end
  
  describe "#create" do
    
    it "is valid name and salon_id are present" do
      Client.new(:name => "bob", :salon_id => 1, :email => "foo@bar.com").should be_valid
    end
    
    it "raises an error if name is missing" do
      Client.new(:name => "", :salon_id => 1).should_not be_valid
    end
    
    it "raises an error if salon_id is missing" do
      Client.new(:name => "bob", :salon_id => nil).should_not be_valid
    end
    
    it "raises an error if the email is not valid" do
      Client.new(:name => "Bob", :salon_id => 1, :email => "foo").should_not be_valid
    end
    
  end
  
end