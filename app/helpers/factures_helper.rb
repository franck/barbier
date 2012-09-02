module FacturesHelper

  def total_facture(facture)
    total = 0
    total = facture.total_items
    number_to_currency(total)
  end

  def total_factures(factures)
    total = 0
    total = factures.inject(0){|total, i| total + i.total_items }
    number_to_currency(total)
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

