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

end
