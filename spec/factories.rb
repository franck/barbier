# encoding: utf-8
FactoryGirl.define do
  factory :client do
    name "Franck Dago"
    email "franck@example.com"
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
  
  factory :theme do
    title 'Mon thème'
  end
  
end
