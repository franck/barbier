# encoding: UTF-8
require 'spec_helper'

describe "Birthday:" do
  let(:salon) { create(:salon) }

  before(:each) do
    set_host("#{salon.subdomain}.test.com")
    log_salon
  end

  context "with a client who's got his birthday this week" do
    let!(:client) { create(:client, salon: salon, birthdate: "1978-06-07", name: "Franck D'agostini", phone: "06 8842 2515") }
    before do
      Date.stub(:today).and_return(Date.parse('2013-06-07'))
      click_link "Clients"
    end
    it "display a message in the clients#index page" do
      page.should have_content "1 client fête son anniversaire cette semaine"
    end
    context "when I click on 'afficher'" do
      it "displays the customer name, birth date and phone number" do
        within("#birthday") do
          page.should have_content "Franck D'agostini"
          page.should have_content "07/06"
          page.should have_content "06 8842 2515"
        end
      end
    end
  end

end
