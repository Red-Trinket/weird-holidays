lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/weird_holidays/version'

Gem::Specification.new do |spec|
  spec.name          = "weird_holidays"
  spec.version       = WeirdHolidays::VERSION
  spec.authors       = ["Matthew Jones"]
  spec.email         = ["matts3371@gmail.com"]

  spec.summary       = %q{"This gem scrapes multiple websites to find out what unique holidays take place on the current day and then describes them to the user"}
  spec.homepage      = "https://github.com/Red-Trinket/weird-holidays"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Red-Trinket/weird-holidays"
  spec.metadata["changelog_uri"] = "https://github.com/Red-Trinket/weird-holidays/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "pry"
end

