class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # def help
  #   Helper.instance
  # end
  # 
  # class Helper
  #   include Singleton
  #   include ActionView::Helpers::TextHelper
  # end
  
  def current_salon
    @current_salon = (Salon.find(session[:salon_id]) if session[:salon_id]) || false
  end
  
  private
  
  def load_salon
    logger.debug("IN LOAD SALON")
    if request.domain != SalonVar::DOMAIN
      @salon = Salon.find_by_domain!(request.domain)
    elsif request.subdomain.present? && request.subdomain != 'www'
      @salon = Salon.find_by_subdomain!(request.subdomain)
    end
  end
  
end
