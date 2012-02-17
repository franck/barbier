def log_salon
  visit "/prive/login"
  fill_in 'salon_password', :with => @salon.password
  click_button 'Me connecter'
end