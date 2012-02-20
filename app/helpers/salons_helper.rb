# encoding: utf-8
module SalonsHelper
  
  def salon_navbar(salon)
    items = []
    items << link_to(salon.try(:name) || "Salon de coiffure", prive_path, :class => 'brand') 
    items << content_tag('div', render_menu.html_safe, :class => 'nav-collapse')
    right_links = []
    right_links << content_tag('li', link_to('Voir le site', '/'))
    right_links << content_tag('li', link_to('Se déconnecter', prive_logout_path, :method => :delete))
    items << content_tag('ul', right_links.join.html_safe, :class => 'nav pull-right')
    container = content_tag('div', items.join.html_safe, :class => 'container' )
    navbar_inner = content_tag('div', container.html_safe, :class => 'navbar-inner')
    content_tag('div', navbar_inner.html_safe, :class => 'navbar')    
  end
  
end
