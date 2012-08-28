require 'spec_helper'

describe Produit do

  it "creates a product if everything is ok" do
    Produit.new(:name => 'Mousse a raser').should be_valid
  end

  it "raises an error if name is missing" do
    Produit.new().should_not be_valid
  end


end
