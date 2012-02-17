module Prive
  class BaseController < ApplicationController
    before_filter :load_salon
    before_filter :authenticate
    
    def authenticate
      if !logged_in?
        redirect_to prive_login_path
      end
    end
    
    def logged_in?
      !!current_salon
    end
    
  end
end