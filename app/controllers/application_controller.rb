class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def load_salon
    @salon = Salon.find_by_subdomain!(request.subdomain)
  end
  
end
