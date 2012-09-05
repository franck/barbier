module FacturesHelper

  def factures_nav
    items = []
    #items << content_tag('li', "Stock", :class => 'nav-header')
    items << content_tag('li', link_to('Calendrier', prive_factures_path), :class => nav_item_active?('prive/factures'))
    items << content_tag('li', link_to('Options', prive_option_factures_path), :class => nav_item_active?('prive/option_factures|prive/category_factures'))
    content_tag('ul', items.join.html_safe, :class => 'nav nav-list')
  end

  def total_items(items)
    items.inject(0){|total, i| total + i.price }
  end
  
  def total_facture(facture)
    number_to_currency(total_items(facture.items))
  end

  def total_factures(factures)
    total = 0
    total = factures.inject(0){|total, i| total + total_items(i.items) }
    number_to_currency(total)
  end

  def total_service(factures, service)
    return if factures.nil?
    items = []
    items << factures.each{|facture| facture.items.where("category = ?", service).all }
    total_items(items.flatten)
  end

  def display_factures_period_date(date, period)
    today = link_to("Aujourd'hui", { date: Date.today, period: 'day' }, :class => 'btn factures-period-date-today')
    if period == 'week'
      date_text = content_tag('span', "#{l(date.beginning_of_week, :format => :shortday)} - #{l(date.end_of_week, :format => :shortday)} #{date.year}", :class => "factures-period-date-text")
      left_arrow = link_to("<", { date: date.prev_week, period: period }, class: "btn btn-primary factures-period-date-link")
      right_arrow = link_to(">", { date: date.next_week, period: period }, class: "btn btn-primary factures-period-date-link")
    elsif period == 'month'
      date_text = content_tag('span', "#{l(date.beginning_of_month, :format => :shortday)} - #{l(date.end_of_month, :format => :shortday)} #{date.year}", :class => "factures-period-date-text")
      left_arrow = link_to("<", { date: date.prev_month, period: period }, class: "btn btn-primary factures-period-date-link")
      right_arrow = link_to(">", { date: date.next_month, period: period }, class: "btn btn-primary factures-period-date-link")
    else # day
      date_text = l(date, :format => :longday)
      left_arrow = link_to("<", { date: date.prev_day, period: period }, class: "btn btn-primary factures-period-date-link")
      right_arrow = link_to(">", { date: date.next_day, period: period }, class: "btn btn-primary factures-period-date-link")
    end
    content_tag 'div', (today + left_arrow + right_arrow + date_text).html_safe, :id => "factures-period-date"
  end

end

