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
  
end
