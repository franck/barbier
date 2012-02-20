require 'spec_helper'

describe Theme do
  
  describe "activate" do  
    before(:each) do
      @salon = create(:salon)
      @theme = create(:theme, :salon_id => @salon.id)
      @othertheme = create(:theme, :salon_id => @salon.id, :state => 'active')
      
    end
    
    it "activate the theme" do
      @theme.activate
      @theme.state.should == 'active'
    end
    
    it "desactivate all other themes" do
      @theme.activate
      @othertheme.reload
      @othertheme.state.should be_nil
    end
    
    context "when the theme is already activated" do
      it "does nothing" do
        @othertheme.activate
        @othertheme.state.should == 'active'
      end
    end
  end
  
  describe "desactivate_all_themes" do
    before(:each) do
      @salon = create(:salon)
      @theme = create(:theme, :salon_id => @salon.id)
      @othertheme = create(:theme, :salon_id => @salon.id, :state => 'active')
    end
    
    it "sets all salon's theme state to nil" do
      Theme.current(@salon.id).should_not be_nil
      Theme.desactivate_all_themes(@salon.id)
      Theme.current(@salon.id).should be_nil
    end
  end
  
  
  describe "current" do
    
    before(:each) do
      @salon = create(:salon)
    end
    
    context "when a current theme exists" do
      it "returns the current theme" do
        @theme = create(:theme, :title => 'theme', :salon_id => @salon.id, :state => 'active')
        @othertheme = create(:theme, :title => 'othertheme', :salon_id => @salon.id)
        Theme.current(@salon.id).title.should == 'theme'
      end
    end
    
    context "when no current theme" do
      it "returns nil" do
        @theme = create(:theme, :title => 'theme', :salon_id => @salon.id)
        Theme.current(@salon.id).should be_nil
      end
    end
    
  end
  
end
