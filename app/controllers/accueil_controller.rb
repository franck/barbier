# encoding: utf-8
class AccueilController < ApplicationController
  before_filter :load_salon
  
  layout 'public'
  
  def index
  end
  
end