require 'spec_helper'

describe TarifCategory do

  context "when sorting" do
    context "on new categorie" do
      it "sets the position to the last one" do
        TarifCategory.create(:name => "foo").position.should == 1
        TarifCategory.create(:name => "bar").position.should == 2
      end
    end

    it "sets the position based on an array of categories id" do
      foo = TarifCategory.create(:name => "foo")
      bar = TarifCategory.create(:name => "bar")
      toto = TarifCategory.create(:name => "toto")

      TarifCategory.order!(['3', '2', '1'])
      foo.reload
      bar.reload
      toto.reload
      foo.position.should == 3
      bar.position.should == 2
      toto.position.should == 1
    end

  end

end
