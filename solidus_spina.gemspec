# frozen_string_literal: true

require_relative 'lib/solidus_spina/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_spina'
  spec.version = SolidusSpina::VERSION
  spec.authors = ['Kenny Buckler']
  spec.email = 'kbuckler@gmail.com'

  spec.summary = 'Spina CMS integration for your Solidus store.'
  spec.homepage = 'https://github.com/kbuckler/solidus_spina#readme'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kbuckler/solidus_spina'
  spec.metadata['changelog_uri'] = 'https://github.com/kbuckler/solidus_spina/blob/master/CHANGELOG.md'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', ['>= 6', '< 7']
  spec.add_dependency 'solidus_core', ['>= 2.10.0', '< 4']
  spec.add_dependency 'solidus_support'
  spec.add_dependency 'spina', ['>= 2.0.0', '< 3']

  spec.add_development_dependency 'solidus_dev_support'
end
