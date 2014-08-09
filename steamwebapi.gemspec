# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "steamwebapi"
  spec.version       = "1.0.0"
  spec.authors       = ["kuzmaa"]
  spec.email         = [""]
  spec.summary       = %q{Steam Web API library in Ruby}
  spec.description   = %q{Retrieves and parses JSON data, which it retrieves from http://api.steampowered.com}
  spec.homepage      = "https://github.com/kuzmaa/steamwebapi"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
