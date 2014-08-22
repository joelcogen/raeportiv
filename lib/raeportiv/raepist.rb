class Raepist
  def self.raep(first_name, last_name, company, middle_name: "")
    permutations = EmailPermutator.permutations(first_name, middle_name, last_name, company)
    email = EmailVerifier.verify_emails(permutations)
    puts "Email of #{first_name} #{last_name} is: #{email}"
    puts "regarts,"
  end
end
