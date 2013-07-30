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

  describe "#has_is_birthday_this_week" do
    let(:salon) { create(:salon) }
    let!(:client1) { create(:client, salon: salon, birthdate: "1978-07-29") }
    let!(:client2) { create(:client, salon: salon, birthdate: "1980-07-30") }
    let!(:client3) { create(:client, salon: salon, birthdate: "1956-07-28") }
    let!(:client4) { create(:client, salon: salon, birthdate: "1995-06-05") }

    it "returns clients who have their birthday this week" do
      Date.stub(:today).and_return(Date.parse("2013-07-30"))
      Client.has_is_birthday_this_week.should == [client1, client2]
    end
  end
end
