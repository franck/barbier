module SalonVar
  if Rails.env == 'development'
    DOMAIN = "lvh.me"
    HOST = "lvh.me:3001"
  elsif Rails.env == 'test'
    DOMAIN = "test.com"
    HOST = "lvh.me:3001"
  else
    DOMAIN = "merrycreation.com"
    HOST = "merrycreation.com"
  end
end