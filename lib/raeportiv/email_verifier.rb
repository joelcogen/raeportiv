require 'net/smtp'

class EmailVerifier
  class << self
    def verify_emails(emails)
      smtp_server = MxResolver.resolve_mx_from_email(emails.first)
      verify_on_smtp(emails, smtp_server)
    end

    def verify_on_smtp(emails, smtp)
      Net::SMTP.start(smtp, 25) do |smtp|
        smtp.helo("raeportiv.io")
        smtp.mailfrom("dolan@raeportiv.io")
        emails
          .map(&:downcase)
          .detect { |email| smtp.rcptto(email) rescue false }
      end
    end
  end
end
