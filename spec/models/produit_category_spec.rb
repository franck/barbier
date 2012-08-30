require 'spec_helper'

describe ProduitCategory do
  it "creates the product category if everthing is OK" do
    ProduitCategory.new(:name => "Shampoing").should be_valid
  end

  it "raises an error if the name is missing" do
    ProduitCategory.new().should_not be_valid
  end
end
