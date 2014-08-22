class Raepist
  def self.raep(first_name, last_name, company, middle_name: "")
    domain_permutations = DomainPermutator.permutations(company)
    domain_permutations.each do |domain|
      permutations = EmailPermutator.permutations(first_name, middle_name, last_name, domain)
      email = EmailVerifier.verify_emails(permutations)
      return email if email
    end
    nil
  end
end
