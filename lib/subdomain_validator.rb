class SubdomainValidator < ActiveModel::EachValidator
  
  def validate_each(object, attribute, value)
    return unless value.present?
    reserved_names = %w(www ftp mail pop smtp admin ssl sftp)
    reserved_names = options[:reserved] if options[:reserved]
    if reserved_names.include?(value)
      object.errors.add(attribute, :reserved)
    end                                              
    
    object.errors.add(attribute, :length) unless (3..63) === value.length
    object.errors.add(attribute, :hyphen) unless value =~ /^[^-].*[^-]$/                                                                                                    
    object.errors.add(attribute, :format) unless value =~ /^[a-z0-9\-]*$/
  end
  
end