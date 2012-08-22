require 'spec_helper'

describe Item do

  it "save the record if attributes are valid?" do
    Item.new(:price => "19,50").should be_valid
  end
  it "raises an error if price is missing" do
    Item.new(:price => "").should_not be_valid
  end
  it "raises an error if price is not a number" do
    Item.new(:price => "bob").should_not be_valid
  end
end
