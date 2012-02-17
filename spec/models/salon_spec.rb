# encoding: UTF-8
require 'spec_helper'

describe Salon do
  
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
      context "when no password" do
        it "does not change the password"
      end
    end
    
    
  end
  
end