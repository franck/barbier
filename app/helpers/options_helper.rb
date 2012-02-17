# encoding: utf-8
module OptionsHelper
  
  def options_nav
    items = []
    items << content_tag('li', link_to('Informations', prive_options_informations_path), :class => option_nav_item_active?('informations'))
    items << content_tag('li', link_to('Photos', prive_options_photos_path), :class => option_nav_item_active?('photos'))
    items << content_tag('li', link_to('Paramètres', prive_options_parametres_path), :class => option_nav_item_active?('parametres'))
    items << content_tag('li', link_to('Sauvegardes', prive_options_sauvegardes_path), :class => option_nav_item_active?('sauvegardes'))
    content_tag('ul', items.join.html_safe, :class => 'nav nav-pills nav-stacked')
  end
  
  def option_nav_item_active?(current_controller)
    'active' if params['controller'] =~ Regexp.new(current_controller)
  end
  
end
