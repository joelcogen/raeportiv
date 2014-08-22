require 'net/smtp'

class EmailVerifier
  class << self
    def verify_email(email)
      smtp_server = MxResolver.resolve_smtp(email)
      verify_on_smtp(email, smtp)
    end


  end
end
