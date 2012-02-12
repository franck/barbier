FactoryGirl.define do
  factory :client do
    name "Franck Dago"
    email "franck@example.com"
  end
  
  factory :salon do
    name "Barbier du moulin"
    subdomain "barbier"
  end
end
