require 'spec_helper'

describe Tarif do
  
  context "when sorting" do
    context "on new tarif" do
      it "sets the position to the last one" do
        Tarif.create(:title => "foo", :price => "19,5").position.should == 1
        Tarif.create(:title => "bar", :price => "12").position.should == 2
      end

      context "when tarifs in different categories" do
        it "sets the position based on the number of tarif inside the same categorie" do
          @category = TarifCategory.create(:name => "foo")
          Tarif.create(:title => "foo", :price => "19,5", :tarif_category_id => @category.id).position.should == 1
          Tarif.create(:title => "foobar", :price => "19,5", :tarif_category_id => @category.id).position.should == 2

          Tarif.create(:title => "bar", :price => "12").position.should == 1
          Tarif.create(:title => "barfoo", :price => "12").position.should == 2
        end
      end
    end

    it "sets the position based on an arror of tarifs ids" do
      foo = Tarif.create(:title => "foo", :price => "12")
      bar = Tarif.create(:title => "bar", :price => "12")
      toto = Tarif.create(:title => "toto", :price => "12")
      Tarif.order!([toto.id.to_s,toto.id.to_s,foo.id.to_s])
      foo.reload
      bar.reload
      toto.reload
      foo.position.should == 3
      bar.position.should == 2
      toto.position.should == 1
    end

  end

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
