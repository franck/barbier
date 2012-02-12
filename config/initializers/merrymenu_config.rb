# Example
# --------------------------------------------------
Merrymenu::Builder.configure do |config|
  config.menu do |m|
    m.tab 'Clients', '/clients'
    m.tab 'Options', '/options'
  end
end

Merrymenu::Builder.configure do |config|
  config.menu :admin do |m|
    m.tab 'Salons', '/salons'
  end
end

