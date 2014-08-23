require 'net/smtp'

class EmailVerifier
  OUR_DOMAIN = "verify-email.org"
  OUR_EMAIL  = "check@verify-email.org"

  class << self
    def verify_emails(emails)
      smtp_server = MxResolver.resolve_mx_from_email(emails.first)
      verify_on_smtp(emails, smtp_server)
    rescue
      nil
    end

    def verify_on_smtp(emails, smtp_address)
      emails.map(&:downcase).detect do |email|
        begin
          print "."
          smtp(smtp_address).rcptto(email)
          true
        rescue Net::SMTPServerBusy => e
          # Server disconnected, force new connection
          puts e
          @smtp = nil
          retry
        rescue => e
          puts e
          # Mail invalid
          false
        end
      end
    end

    def smtp(smtp_address)
      @smtp ||= Net::SMTP.start(smtp_address).tap do |smtp|
        smtp.helo(OUR_DOMAIN)
        smtp.mailfrom(OUR_EMAIL)
      end
    end
  end
end
