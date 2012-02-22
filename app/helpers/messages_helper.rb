# encoding: utf-8
module MessagesHelper
  
  def publish_on_facebook_account(form, facebook_account, message)
    
    if facebook_account && message.published_on_facebook_account_at.nil?
      disabled =  false
    else
      disabled = true
    end
    
    checkbox = form.check_box(:publish_on_facebook_account, :disabled => disabled)
    checkbox << ("&nbsp;").html_safe
    span_content = "Publier sur le compte Facebook"
    span_content << " : #{facebook_account.name}" if facebook_account
    checkbox << content_tag('span', span_content)
    checkbox << content_tag('span', "envoyé", :class => 'sent') if message.published_on_facebook_account_at
    
    content_tag('label', checkbox, :class => "checkbox disabled-#{disabled}")
  end
  
  def publish_on_facebook_page(form, facebook_account, message)
    if facebook_account && facebook_account.page_name && message.published_on_facebook_page_at.nil?
      disabled = false
    else
      disabled = true
    end
    
    checkbox = form.check_box(:publish_on_facebook_page, :disabled => disabled)
    checkbox << ("&nbsp;").html_safe
    span_content = "Publier sur la page Facebook"
    span_content << " : #{facebook_account.page_name}" if facebook_account.try(:page_name).present?
    checkbox << content_tag('span', span_content)
    checkbox << content_tag('span', "envoyé", :class => 'sent') if message.published_on_facebook_account_at
    
    content_tag('label', checkbox, :class => "checkbox disabled-#{disabled}")
  end
  
  def send_by_sms
    disabled =  true
    
    checkbox = check_box_tag(:send_by_sms, "1", false, :disabled => disabled)
    checkbox << ("&nbsp;").html_safe
    span_content = "Envoyer par SMS"
    checkbox << content_tag('span', span_content)
    
    content_tag('label', checkbox, :class => "checkbox disabled-#{disabled}")
  end
  
  
end