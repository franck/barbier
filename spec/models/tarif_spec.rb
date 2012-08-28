require 'spec_helper'

describe Tarif do

  it "creates a tarif if everything is OK" do
    Tarif.new(:title => "Coiffure pour homme", :price => "19,5").should be_valid
  end

  it "raises an error if title is missing" do
    Tarif.new(:title => "", :price => "19,5").should_not be_valid
  end

  it "raises an error if price is missing" do
    Tarif.new(:title => "Coiffure pour homme", :price => "").should_not be_valid
  end

  it "raises an error if price is in wrong format" do
    Tarif.new(:title => "Coiffure pour homme", :price => "foo").should_not be_valid
  end

end
