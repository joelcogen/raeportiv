Gem::Specification.new do |spec|
  spec.name          = "Raeportiv"
  spec.version       = "0.0.1"
  spec.authors       = ["Joel Cogen", "Nicolas Jacobeus"]
  spec.email         = ["joel@redilio.us", "nicolas.jacobeus@belighted.com"]
  spec.description   = %q{Raeportiv, biatsh}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/joelcogen/raeportiv"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  # spec.add_development_dependency "rake"
  # spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
end
