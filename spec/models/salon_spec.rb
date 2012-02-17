# encoding: UTF-8
require 'spec_helper'

describe Salon do
  
  describe "subdomain field" do
    
    context "when normal" do
      it "works" do
        salon = Salon.new(:name => "Bob", :subdomain => "test")
        salon.should be_valid
      end
    end
    
    context "when two letters only" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "ab")
        salon.should_not be_valid
      end
    end
    
    context "when 64 letters long" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        salon.should_not be_valid
      end
    end
    
    context "when contains accents" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "accentué")
        salon.should_not be_valid
      end
    end
    
    context "when reserved word" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "www")
        salon.should_not be_valid
      end
    end
    
    context "when start by hypen" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "-test")
        salon.should_not be_valid
      end
    end
    
    context "when end by hypen" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "test-")
        salon.should_not be_valid
      end
    end
    
    context "when using MAJ" do
      it "raise an error" do
        salon = Salon.new(:name => "Bob", :subdomain => "Test")
        salon.should_not be_valid
      end
    end
    
  end
  
end