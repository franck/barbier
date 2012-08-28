# encoding: utf-8
module OptionsHelper
  
  def options_nav
    items = []
    items << content_tag('li', link_to('Paramètres', prive_options_parametres_path), :class => nav_item_active?('parametres'))
    items << content_tag('li', link_to('Facebook', prive_options_facebooks_path), :class => nav_item_active?('facebooks'))
    items << content_tag('li', link_to('Sauvegardes', prive_options_sauvegardes_path), :class => nav_item_active?('sauvegardes'))
    content_tag('ul', items.join.html_safe, :class => 'nav nav-pills nav-stacked')
  end
  
end
