# encoding: utf-8
module PublicHelper
  
  def public_info(salon)
    content = ""
    content << content_tag("h3", "Contact")
    infos = []
    infos << link_to(salon.public_email, "mailto:#{salon.public_email}") if salon.public_email.present?
    infos << public_phone(salon)
    infos << public_address(salon)
    content << infos.join('<br/>')
    content_tag('div', content.html_safe, :class => 'well info')
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
