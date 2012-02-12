def set_host(host)
  host! host
  Capybara.app_host = "http://" + host
end