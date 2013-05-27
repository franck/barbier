# encoding: utf-8
module SalonsHelper
  
  def salon_navbar_left_links(controller)
    case controller
    when "prive/clients"
      clients_class = "active" 
    when "prive/factures"
      factures_class = "active"
    when /prive\/boutique/
      boutique_class = "active"
    end

    items = []
    items << content_tag('li', link_to('Clients', prive_clients_path), :class => clients_class)
    items << content_tag('li', link_to('Factures', prive_factures_path), :class => factures_class)
    items << content_tag('li', link_to('Boutique', prive_boutique_path), :class => boutique_class)
    content_tag('ul', items.join.html_safe, :class => 'nav')
  end

  def salon_navbar_right_links(controller)
    case controller
    when /^prive\/site/
      site_class = "active" 
    when /^prive\/options/
      options_class = "active" 
    end

    items = []
    items << content_tag('li', link_to('Site web', prive_site_path), :class => site_class)
    items << content_tag('li', link_to('Options', prive_options_path), :class => options_class)
    items << "<li class='divider-vertical'></li>"
    items << content_tag('li', link_to('Voir le site', '/'))
    items << content_tag('li', link_to('Se déconnecter', prive_logout_path, :method => :delete))
    items.join.html_safe
  end
  
end
