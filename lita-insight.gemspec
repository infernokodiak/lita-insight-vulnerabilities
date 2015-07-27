Gem::Specification.new do |spec|
  spec.name          = "lita-insight"
  spec.version       = "0.1.0"
  spec.authors       = "John Ramos"
  spec.email         = "john.ramos@gmail.com"
  spec.description   = "handler to integrate with cloud-insight"
  spec.summary       = "handler to integrate with cloud-insight"
  spec.homepage      = "http://127.0.0.1"
  spec.license       = "license"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.4"
  spec.add_runtime_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
