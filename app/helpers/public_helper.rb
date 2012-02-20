# encoding: utf-8
module PublicHelper
  
  def public_messages(messages)
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
    content_tag('div', items.join.html_safe, :class => 'info')
  end
  
  def public_photos(salon)
    photos = []
    for photo in salon.photos
			photos << image_tag(photo.picture.url(:thumb))
		end
		gutter= content_tag('span', '&nbsp;'.html_safe, :class => 'gutter' )
		content_tag('div', photos.join(gutter).html_safe, :class => 'photos')
  end
  
  def public_contact(salon)
    content = ""
    content << content_tag("h3", "Contact")
    infos = []
    infos << link_to(salon.public_email, "mailto:#{salon.public_email}") if salon.public_email.present?
    infos << public_phone(salon)
    infos << public_address(salon)
    content << infos.join('<br/>')
    content_tag('div', content.html_safe, :class => 'well contact')
  end
  
  def public_phone(salon)
    return unless salon.phone.present?
    text_label = content_tag('strong', "Tél : ")
    text_label + salon.phone
  end
  
  def public_address(salon)
    address_text = ""
    
    if salon.address.present? || salon.postalcode.present? || salon.city.present?
      address_text << content_tag('h4', "Adresse")
    end
    address_lines = []
    address_lines << salon.address if salon.address.present?
    postalcode_and_city = []
    postalcode_and_city << salon.postalcode if salon.postalcode.present?
    postalcode_and_city << salon.city if salon.city.present?
    address_lines << postalcode_and_city.join(' - ')
    address_text << address_lines.join('<br/>')
  end
  
end
