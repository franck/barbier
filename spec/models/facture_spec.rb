require 'spec_helper'

describe Facture do

  it "save the record if all attributes are valid" do
    Facture.new(:mean_of_payment => "cash", :payed_at => "12/05/2012", :items_attributes => {"123456" => { :price => "19,5" }}).should be_valid
  end

  it "raises an error if mean of payment is missing" do
    Facture.new(:mean_of_payment => "", :payed_at => "12/05/2012", :items_attributes => {"123456" => { :price => "19,5" }}).should_not be_valid
  end

  describe "on items validation" do

    it "does not create the facture if no item" do
      Facture.new(:payed_at => "12/05/2012").should_not be_valid
    end

    it "rejects items with no price" do
      Facture.new(:payed_at => "12/05/2012", :items_attributes => [{:price => ""}]).should_not be_valid
    end

    it "rejects items with a price with a wrong format" do
      Facture.new(:payed_at => "12/05/2012", :items_attributes => [{:price => "bob"}]).should_not be_valid
    end

  end

end
