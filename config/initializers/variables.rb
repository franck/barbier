module SalonVar
  if Rails.env == 'development'
    HOST = "lvh.me:3000"
  else
    HOST = "merrycreation.com"
  end
end