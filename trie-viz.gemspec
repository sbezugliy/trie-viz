# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trie/viz/version'

Gem::Specification.new do |spec|
  spec.name          = 'trie-viz'
  spec.version       = TrieViz::VERSION
  spec.authors       = ['Sergey Bezugliy']
  spec.email         = ['s.bezugliy@gmail.com']

  spec.summary       = 'Trie vizualization for trie-substring-search'
  spec.description   = 'Trie vizualization for trie-substring-search'
  spec.homepage      = 'https://codenv.top'

  spec.required_ruby_version = '~> 3.1'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either
  # set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow
  # pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org'"

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/sbezugliy/trie-viz'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'bundler'
  spec.add_runtime_dependency 'haml'
  spec.add_runtime_dependency 'newrelic_rpm'
  spec.add_runtime_dependency 'puma'
  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'rake'
  spec.add_runtime_dependency 'ruby-graphviz'
  spec.add_runtime_dependency 'sinatra'
  spec.add_runtime_dependency 'sinatra-contrib'
  spec.add_runtime_dependency 'trie-substring-search'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
