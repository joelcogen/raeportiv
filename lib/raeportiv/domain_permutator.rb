class DomainPermutator
  SEPARATORS = ["", "-", "_"]
  TLDS = %w(com net org co info eu us ca be fr nl de es it)

  class << self
    def permutations(company)
      company = company.downcase
      simple_companies = permutate(company)
      simple_companies.map { |c| domainify(c) }.flatten
    end

    def permutate(company)
      return [company] unless company.include?(" ")
      SEPARATORS.map do |sep|
        company.gsub(' ', sep)
      end
    end

    def domainify(company)
      TLDS.map do |tld|
        "#{company}.#{tld}"
      end
    end
  end
end
