class EmailPermutator

	PATTERNS = [
		"{fn}",
		"{ln}",
		"{fn}{ln}",
		"{fn}.{ln}",
		"{fi}{ln}",
		"{fi}.{ln}",
	  "{fn}{li}",
    "{fn}.{li}",
    "{fi}{li}",
    "{fi}.{li}",
    "{ln}{fn}",
    "{ln}.{fn}",
    "{ln}{fi}",
    "{ln}.{fi}",
    "{li}{fn}",
    "{li}.{fn}",
    "{li}{fi}",
    "{li}.{fi}",
    "{fi}{mi}{ln}",
    "{fi}{mi}.{ln}",
    "{fn}{mi}{ln}",
    "{fn}.{mi}.{ln}",
    "{fn}{mn}{ln}",
    "{fn}.{mn}.{ln}",
    "{fn}-{ln}",
    "{fi}-{ln}",
    "{fn}-{li}",
    "{fi}-{li}",
    "{ln}-{fn}",
    "{ln}-{fi}",
    "{li}-{fn}",
    "{li}-{fi}",
    "{fi}{mi}-{ln}",
    "{fn}-{mi}-{ln}",
    "{fn}-{mn}-{ln}",
    "{fn}_{ln}",
    "{fi}_{ln}",
    "{fn}_{li}",
    "{fi}_{li}",
    "{ln}_{fn}",
    "{ln}_{fi}",
    "{li}_{fn}",
    "{li}_{fi}",
    "{fi}{mi}_{ln}",
    "{fn}_{mi}_{ln}",
    "{fn}_{mn}_{ln}"
	]

	def self.permutations(fn = "", mn = "", ln = "", domain = "")
    fi = fn[0] || ""
    mi = mn[0] || ""
    li = ln[0] || ""
    PATTERNS.map { |email| email.gsub("\{fn\}",fn).
                                 gsub("\{ln\}",ln).
                                 gsub("\{mn\}",mn).
                                 gsub("\{fi\}",fi).
                                 gsub("\{li\}",li).
                                 gsub("\{mi\}",mi)+"@#{domain}"}
	end
end