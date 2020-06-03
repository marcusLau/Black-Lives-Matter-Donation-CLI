require_relative 'lib/donate/version'

Gem::Specification.new do |spec|
  spec.name          = "donate"
  spec.version       = Donate::VERSION
  spec.authors       = ["marcusLau"]
  spec.email         = ["lau.marcus76@gmail.com"]

  spec.summary       = "Donate to Foundation"
  spec.description   = "Find more information about Foundations"
  spec.homepage      = "http://rubygems.org"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

end
