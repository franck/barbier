module ClientsHelper
  
  
  def client_infos(client)
    content = []
    content << client.phone if client.phone && client.phone.present?
    content << client.email if client.email && client.email.present?
    content_tag("div", content.join(' - '), :id => 'infos')
  end  
  
  def client_birthdate(client)
    date = client.birthdate.present? ? client.birthdate : "pas de date"
    content_tag('p', "Date de naissance : #{date}")
  end
  
end
