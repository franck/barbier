require 'spec_helper'

describe Photo do
  
  describe "#create" do
    
    context "when file is missing" do
      it "raise an error" do
        photo = Photo.new
        photo.should_not be_valid
      end
    end
    
  end
  
  
end
