# frozen_string_literal: true

require_relative 'lib/tweet_storm/version'

Gem::Specification.new do |spec|
  spec.name = 'tweet_storm'
  spec.version = TweetStorm::VERSION
  spec.authors = ['engr.hasanuzzaman']
  spec.email = ['hasanuzzaman.sumon@gmail.com']

  spec.summary = 'Gem for generating tweetstorm'
  spec.description = 'Gem for generating tweetstorm'
  spec.homepage = 'https://github.com/engr-hasanuzzaman/tweet_storm.git'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5'

  spec.metadata['allowed_push_host'] = spec.homepage

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables << 'tweetstormgenerator'
  spec.executables << 'create_alias'
  spec.require_paths = ['lib']

  # dev dependency
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
