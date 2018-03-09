
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "filemerger/version"

Gem::Specification.new do |spec|
  spec.name          = "filemerger"
  spec.version       = Filemerger::VERSION
  spec.authors       = ["Yury Bogdanov"]
  spec.email         = ["yury-bogdanov@mail.ru"]

  spec.summary       = %q{Ruby gem for merging files}
  spec.description   = %q{Ruby gem for merging files.}
  spec.homepage      = "https://github.com/yurybogdanov/filemerger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor"
  spec.add_dependency "colorize"
  spec.add_dependency "json"
  spec.add_dependency "xcodeproj"
end
