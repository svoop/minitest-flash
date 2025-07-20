# frozen_string_literal: true

require_relative 'lib/minitest/flash/version'

Gem::Specification.new do |spec|
  spec.name        = 'minitest-flash'
  spec.version     = Minitest::Flash::VERSION
  spec.summary     = 'Simple Minitest reporter to indicate the result of test runs in as fancy a way you like'
  spec.description = <<~END
    Simple Minitest reporter to indicate the result of test runs. After every
    test run, the reporter invokes the `minitest-flash` executable (created by
    you and to your liking) with either the argument "green" or "red" to reflect
    the result of the run.
  END
  spec.authors     = ['Sven Schwyn']
  spec.email       = ['ruby@bitcetera.com']
  spec.homepage    = 'https://github.com/svoop/minitest-flash'
  spec.license     = 'MIT'

  spec.metadata = {
    'homepage_uri'      => spec.homepage,
    'changelog_uri'     => 'https://github.com/svoop/minitest-flash/blob/main/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/svoop/minitest-flash',
    'documentation_uri' => 'https://www.rubydoc.info/gems/minitest-flash',
    'bug_tracker_uri'   => 'https://github.com/svoop/minitest-flash/issues'
  }

  spec.files         = Dir['lib/**/*']
  spec.require_paths = %w(lib)

  spec.extra_rdoc_files = Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt']
  spec.rdoc_options    += [
    '--title', 'Minitest::Flash',
    '--main', 'README.md',
    '--line-numbers',
    '--inline-source',
    '--quiet'
  ]

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_runtime_dependency 'minitest', '>= 5'

  spec.add_development_dependency 'debug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-focus'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'yard'
end
