# frozen_string_literal: true

require_relative "tweet_storm/version"
require_relative 'tweet_storm/generator'
require_relative 'color'

module TweetStorm
  class App
    def self.run(args)
      # -------------------------------
      # input pre-processing
      # handle input without quotation
      #-------------------------------
      tweet_text = args.map(&:strip).reject(&:empty?).join(' ')

      if tweet_text.empty?
        puts 'Ops!, Tweet text is missing. Please provide the required tweet text'.red.bold
        puts 'Notes: White space will be removed form the input text'.blue
        print 'Sample usage: '.green
        print "#{'app_path/tweetstormgenerator'.blue} #{'sample tweet text or "sample tweet text"'.cyan}".bold
      else
        tweets = Generator.call(tweet_text)

        puts '-----------Generated Tweets are ---------------------------'.cyan

        tweets.each do |tweet|
          puts tweet
          puts
        end
      end
    end
  end
end
