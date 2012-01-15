class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def load_salon
    if request.domain != SalonVar::DOMAIN
      @salon = Salon.find_by_domain!(request.domain)
    elsif request.subdomain.present? && request.subdomain != 'www'
      @salon = Salon.find_by_subdomain!(request.subdomain)
    end
  end
  
end
