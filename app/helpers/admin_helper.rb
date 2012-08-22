module AdminHelper

  def admin_navbar_left_links(controller)
    case controller
    when "admin/salons"
      salons_class = "active" 
    end

    items = []
    items << content_tag('li', link_to('Salons', admin_salons_path), :class => salons_class)
    content_tag('ul', items.join.html_safe, :class => 'nav')
  end

end
