# encoding: utf-8
class AccueilController < ApplicationController
  before_filter :load_salon
  
  layout 'public'
  
  def index
    @current_theme = Theme.current(@salon.id)
    if @current_theme
      render :inline => @current_theme.html, :layout => 'public'
    else
      render
    end
  end
  
end