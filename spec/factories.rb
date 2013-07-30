# encoding: utf-8
FactoryGirl.define do
  factory :client do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
  end

  factory :facture do
    payed_at "15/05/2012"
    mean_of_payment "cash"
  end
  
  factory :salon do
    name "Barbier du moulin"
    subdomain "barbier"
    password "foobar"
  end
  
  factory :photo do
    picture File.new(Rails.root.join('spec/support/photos/barbier.jpg'))
  end
  
  factory :message do
    title 'Un titre de message'
  end
  
  factory :tarif do
    title 'Coiffure homme'
    price '19,5'
  end

  factory :tarif_category do
    name 'Coiffure'
  end
  
  factory :theme do
    title 'Mon thème'
  end

  factory :produit do
    name "Mousse a raser"
  end
  
  factory :produit_category do
    name "Shampoing"
  end

  factory :facebook_account do
    identifier "717032770"
    name "Franck D'agostini"
    picture "https://graph.facebook.com/717032770/picture"
    access_token "AAACQhIBlqNcBAC8ZAVaZCOX9VAUfiHhgaTjDDK8uudLsNOBEJq"
  end
  
  factory :facebook_account_with_page, :class => "FacebookAccount" do
    identifier "104147636289120"
    name "Franck D'agostini"
    picture "https://graph.facebook.com/717032770/picture"
    access_token "AAACQhIBlqNcBAC8ZAVaZCOX9VAUfiHhgaTjDDK8uudLsNOBEJq"
    page_access_token "AAACQhIBlqNcBAC8ZAVaZCOX9VAUfiHhgaTjDDK8uudLsNOBEJq"
    page_name "Barbier du moulin"
    page_identifier "717032770"
    page_picture "https://graph.facebook.com/104147636289120/picture"
  end
  
end
