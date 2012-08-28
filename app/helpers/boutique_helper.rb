module BoutiqueHelper

  def boutique_nav
    items = []
    items << content_tag('li', "Stock", :class => 'nav-header')
    items << content_tag('li', link_to('Produits', prive_boutique_produits_path), :class => nav_item_active?('produits'))
    content_tag('ul', items.join.html_safe, :class => 'nav nav-list')
  end
  
end
