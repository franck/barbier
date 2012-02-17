require 'digest/sha2'
module Password
  
  def Password.encrypt(text)
    Digest::SHA512.hexdigest(text)
  end

  def Password.match?(crypted, text)
    encrypt(text) == crypted
  end
  
end