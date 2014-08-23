class Raepist
  def self.raep(first_name, last_name, company, middle_name: "")
    domain_permutations = DomainPermutator.permutations(company)
    domain_permutations.each do |domain|
      print "\nTrying #{domain}"
      permutations = EmailPermutator.permutations(first_name, middle_name, last_name, domain)
      if email = EmailVerifier.verify_emails(permutations)
        puts "\nFound: #{email}"
        return email
      end
    end
    nil
  end
end
