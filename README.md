# TweetStorm

This is a tweet-storm generator which will break large text into tweetable smaller text following the below rules
- Each tweet can't be over 140 characters.
- Each tweet will be suffixed with an indicator of the tweet number and the total number of tweets.

## Installation

Add this line to your application's Gemfile:

**N.B: If you do not have any Gemfile, you can create one by following**
- opent terminal & run the following commands
```bash
mkdir my_project
cd my_project
touch Gemfile
```
add the follow line on your Gemfile

```ruby
gem 'tweet_storm', :git => 'https://github.com/engr-hasanuzzaman/tweet_storm.git'
```

Go to the project root filder and then execute:

    $ bundle install
## Usage

- `bundle exec tweetstormgenerator "you large tweet text that want to break"`

## Use with other application
You can call the libray from your code as the following

```ruby
require 'tweet_storm'

TweetStorm::App.run(['test input'])
# if you only want to use generator without any pre-processing
TweetStorm::Generator.call(['test input'])
```

**N.B: if you bundler run your code as `bundle exec foo.rb` to ensure installed gem are proprly loaded**
### How to access `tweetstormgenerator` without `bundle exec`?
- create alison on `.bashrc` or `.zshrc` like `alias tweetstormgenerator='bash bundle exec tweetstormgenerator' `  (Not very user friendly way to do :( )

**N.B: The following way has a issue. It does not work always**
- Rub the following command `bundle exec create_alias` which will create a alias under `/usr/local/bin/`
- run `tweetstormgenerator` using either `/usr/local/bin/tweetstormgenerator` or only `tweetstormgenerator`
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Todos
- [ ] improve the test coverage
- [ ] use `thor` or similar gem which will provide rich command line experience
- [ ] update large text breaking logic rather than breaking with white space
- [ ] publish to `rubygems.org` (having trouble to publish gem to `rubygems.org`)
- [ ] use well established library for terminal text coloring instead of rely on hard coded unix color
## Contributing

Bug reports and pull requests are welcome on GitHub at [link](https://github.com/engr-hasanuzzaman/tweet_storm). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/engr-hasanuzzaman/tweet_storm/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TweetStorm project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tweet_storm/blob/master/CODE_OF_CONDUCT.md).
