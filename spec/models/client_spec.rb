# encoding: UTF-8
require 'spec_helper'

describe Client do
  
  it "set the birthdate with text" do
    client = Client.new(:name => 'Bob', :birthdate => '07/06/1978')
    client.birthdate.strftime('%d/%m/%Y').should == "07/06/1978"
    client.birthdate.strftime('%d/%m/%y').should == "07/06/78"
  end
  
end