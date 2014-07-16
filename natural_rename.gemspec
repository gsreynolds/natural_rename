lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'natural_rename'
  spec.version       = '1.0'
  spec.authors       = ['Gavin Reynolds']
  spec.email         = ['g.reynolds@src.gla.ac.uk']
  spec.description   = 'A utility for renaming files preserving their natural order'
  spec.summary       = 'A command-line utility for preserving natural file name ordering for consumption by systems which use ASCII ordering'
  spec.homepage      = 'https://github.com/gsreynolds/natural_rename'
  spec.license       = 'GPL-2'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9'

  # Runtime dependencies
  spec.add_dependency 'naturally', '~> 1.3'
  spec.add_development_dependency 'rspec',          '~> 3.0'
  spec.add_development_dependency 'fakefs',          '~> 0.5'
end
