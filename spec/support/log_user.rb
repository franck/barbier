def log_salon
  visit "/prive/login"
  fill_in 'password', :with => 'foobar'
  click_button 'Me connecter'
end