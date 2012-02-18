# Example
# --------------------------------------------------
Merrymenu::Builder.configure do |config|
  config.menu do |m|
    m.tab 'Clients', '/prive/clients'
    m.tab 'Site', '/prive/site'
    m.tab 'Options', '/prive/options'
  end
end

Merrymenu::Builder.configure do |config|
  config.menu :admin do |m|
    m.tab 'Salons', '/admin/salons'
  end
end

