# Example
# --------------------------------------------------
Merrymenu::Builder.configure do |config|
  config.menu do |m|
    m.tab 'Clients', '/clients'
    m.tab 'Options', '/options'
  end
end