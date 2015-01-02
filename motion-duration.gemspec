# -*- encoding: utf-8 -*-
VERSION = "0.0.1"

Gem::Specification.new do |spec|
  spec.name          = "motion-duration"
  spec.version       = VERSION
  spec.authors       = ["Mark Rickert"]
  spec.email         = ["mark@otgapps.io"]
  spec.description   = "Motion::Duration is an immutable type that represents some amount of time with accuracy in seconds."
  spec.summary       = "Motion::Duration is an immutable type that represents some amount of time with accuracy in seconds."
  spec.homepage      = "https://github.com/otgapps/motion-duration"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
