require 'resolv'

class MxResolver
  class << self
    def resolve_mx_from_email(email)
      domain = email.match(/@(.*)\z/).captures.last
      resolve_mx(domain)
    end

    def resolve_mx(domain)
      Resolv::DNS.open do |dns|
        mail_servers = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
        highest_priority = mail_servers.first
        mail_servers.each do |server|
          highest_priority = server if server.preference < highest_priority.preference
        end
        mx = highest_priority.exchange.to_s
        return mx
      end
    end
  end
end
