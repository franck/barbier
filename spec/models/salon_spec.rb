# encoding: UTF-8
require 'spec_helper'

describe Salon do
  
  describe "pubmic_email" do
    context "when invalid" do
      it "raises an error" do
        salon = create(:salon)
        salon.public_email = "foo"
        salon.save
        salon.should_not be_valid
      end
    end

  end
  
  
  describe "subdomain field" do    
    context "when normal" do
      it "works" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "test")
        salon.should be_valid
      end
    end
    context "when two letters only" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "ab")
        salon.should_not be_valid
      end
    end
    context "when 64 letters long" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        salon.should_not be_valid
      end
    end
    context "when contains accents" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "accentué")
        salon.should_not be_valid
      end
    end
    context "when reserved word" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "www")
        salon.should_not be_valid
      end
    end
    context "when start by hypen" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "-test")
        salon.should_not be_valid
      end
    end
    context "when end by hypen" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "test-")
        salon.should_not be_valid
      end
    end
    context "when using MAJ" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :password => 'test', :password_confirmation => 'test', :subdomain => "Test")
        salon.should_not be_valid
      end
    end
  end
  
  describe "password field" do
    describe "on create" do
      context "when no password" do
        it "raise an error" do
          salon = Salon.new(:name => 'Barbier du moulin', :subdomain => 'barbier', :password => "")
          salon.should_not be_valid
        end
      end
      context "when no password confirmation" do
        it "raise an error" do
          salon = Salon.new(:name => 'Barbier du moulin', :subdomain => 'barbier', :password => "test", :password_confirmation => '')
          salon.should_not be_valid
        end
      end
      context "when password does not match confirmation" do
        it "raise an error" do
          salon = Salon.new(:name => 'Barbier du moulin', :subdomain => 'barbier', :password => "test", :password_confirmation => 'bob')
          salon.should_not be_valid
        end
      end
      context "when password is too short" do
        it "raise an error" do
          salon = Salon.new(:name => 'Barbier du moulin', :subdomain => 'barbier', :password => "aa", :password_confirmation => 'aa')
          salon.should_not be_valid
        end
      end
    end
    
    describe "on update" do 
      context "when correct password given" do
        it "change the password" do
          salon = create(:salon)
          salon.update_attributes(:password => 'newpassword', :password_confirmation => 'newpassword')
          salon.should be_valid
          salon.authenticate("newpassword").should be_true
        end
      end  
      context "when no password" do
        it "does not change the password" do
          salon = create(:salon)
          salon.update_attributes(:password => '', :password_confirmation => '')
          salon.should be_valid
          salon.authenticate("foobar").should be_true
        end
      end
    end  
  end
  
  describe "on destroy" do
    before(:each) do
      @salon = create(:salon)
    end  
    it "destroy associated clients" do
      client = create(:client, :salon_id => @salon.id)
      @salon.destroy
      Client.count.should == 0
    end
    it "destroy associated photos" do
      client = create(:photo, :salon_id => @salon.id)
      @salon.destroy
      Photo.count.should == 0
    end
    it "destroy associated messages" do
      client = create(:message, :salon_id => @salon.id)
      @salon.destroy
      Message.count.should == 0
    end
    it "destroy associated tarifs" do
      client = create(:tarif, :salon_id => @salon.id)
      @salon.destroy
      Tarif.count.should == 0
    end
    it "destroy associated themes" do
      client = create(:theme, :salon_id => @salon.id)
      @salon.destroy
      Theme.count.should == 0
    end
    it "destroy associated facebook account" do
      client = create(:facebook_account, :salon_id => @salon.id)
      @salon.destroy
      FacebookAccount.count.should == 0
    end
  end
  
end
