# encoding: utf-8
module SiteHelper
  
  def site_nav
    items = []
    items << content_tag('li', "Basic", :class => 'nav-header')
    items << content_tag('li', link_to('Messages', prive_site_messages_path), :class => nav_item_active?('messages'))
    items << content_tag('li', link_to('Informations', prive_site_informations_path), :class => nav_item_active?('informations'))
    items << content_tag('li', link_to('Contact', prive_site_contact_path), :class => nav_item_active?('contacts'))
    items << content_tag('li', link_to('Photos', prive_site_photos_path), :class => nav_item_active?('photos'))
    items << content_tag('li', link_to('Tarifs', prive_site_tarifs_path), :class => nav_item_active?('tarifs'))
    items << content_tag('li', link_to('Facebook', prive_site_facebook_path), :class => nav_item_active?('facebook'))
    items << content_tag('li', "Avancée", :class => 'nav-header')
    items << content_tag('li', link_to('Thèmes', prive_site_themes_path), :class => nav_item_active?('themes'))
    content_tag('ul', items.join.html_safe, :class => 'nav nav-list')
  end
  
  
end
