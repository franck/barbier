# encoding: utf-8
module PublicHelper
  
  def public_messages(messages)
    return if messages.size == 0
    items = []
    for message in messages
      items << content_tag('dt', message.title)
      items << content_tag('dd', markdown(message.content)) if message.content.present?
    end
    messages_list = content_tag('dl', items.join.html_safe)
    content_tag('div', messages_list, :class => 'messages')
  end
  
  def public_info(salon)
    items = []
    items << content_tag('h2', salon.title) if salon.title.present?
    items << markdown(salon.description) if salon.description.present?
    if items.size > 0
      content_tag('div', items.join.html_safe, :class => 'info')
    end
  end
  
  def public_photos(photos)
    photos_items = []
    for photo in photos
			photos_items << image_tag(photo.picture.url(:thumb))
		end
		gutter= content_tag('span', '&nbsp;'.html_safe, :class => 'gutter' )
		content_tag('div', photos_items.join(gutter).html_safe, :class => 'photos')
  end
  
  def public_contact(salon)
    content = ""
    content << content_tag("h3", "Contact")
    infos = []
    infos << link_to(salon.public_email, "mailto:#{salon.public_email}") if salon.public_email.present?
    infos << public_phone(salon.phone) if salon.phone.present?
    
    if salon.address.present? || salon.postalcode.present? || salon.city.present?
      infos << public_address(:address => salon.address, :postalcode => salon.postalcode, :city => salon.city)
    end
    
    if infos.size > 0
      content << infos.join('<br/>')
      content_tag('div', content.html_safe, :class => 'well contact')
    end
  end
  
  def public_phone(phone)
    return unless phone.present?
    text_label = content_tag('strong', "Tél : ")
    text_label + phone
  end
  
  def public_address(options={})
    address_text = ""
    
    if options[:address].present? || options[:postalcode].present? || options[:city].present?
      address_text << content_tag('h4', "Adresse")
    end
    address_lines = []
    address_lines << options[:address] if options[:address].present?
    postalcode_and_city = []
    postalcode_and_city << options[:postalcode] if options[:postalcode].present?
    postalcode_and_city << options[:city] if options[:city].present?
    address_lines << postalcode_and_city.join(' - ')
    address_text << address_lines.join('<br/>')
  end
  
end
