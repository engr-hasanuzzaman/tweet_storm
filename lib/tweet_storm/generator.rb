# frozen_string_literal: true

require_relative 'exceptions'

module TweetStorm
  # --------------
  # main class
  # -------------
  class Generator
    #----------------
    # constants
    #----------------

    MAX_CHAR_COUNT = 140

    #----------------
    # class variables
    #----------------

    # rubocop:disable Style/ClassVars
    @@suffix_size = nil
    @@max_content_size = nil

    #----------------
    # class methods
    #----------------
    def self.call(tweet_text)
      tweet_text.strip!
      @@tweet_text =  tweet_text

      return [@@tweet_text] if @@tweet_text.size <= MAX_CHAR_COUNT

      tweets_with_sufix generate_tweets(tweet_text)
    end

    def self.generate_tweets(tweet_text)
      tweets = []
      cur_tweet = ''

      tweet_text.split.map(&:strip).each do |word|
        raise WordSizeExceedLimit unless valid_content_size?(word)

        if cur_tweet.empty?
          cur_tweet = word
        elsif valid_content_size?("#{cur_tweet} #{word}")
          cur_tweet = "#{cur_tweet} #{word}"
        else
          tweets << cur_tweet
          cur_tweet = word
        end
      end

      # handle the remaining tweet text
      tweets << cur_tweet unless cur_tweet.empty?

      tweets
    end

    def self.tweets_with_sufix(tweets)
      tweets_count = tweets.count

      tweets.map.with_index do |tweet, index|
        raise WordSizeExceedLimit if "#{tweet} #{index + 1}/#{tweets_count}".size > MAX_CHAR_COUNT

        "#{tweet} #{index + 1}/#{tweets_count}"
      end
    end

    def self.valid_content_size?(tweet)
      max_content_size >= tweet.size
    end

    # TODO: have to refactor to reduce the complexity
    # rubocop:disable Metrics/AbcSize
    def self.suffix_size
      # return if already calculated
      @@suffix_size unless @@suffix_size.nil?

      tweets_count = (@@tweet_text.size / MAX_CHAR_COUNT.to_f).ceil
      #----------------
      # if tweets_count be 12 then suffix_size will be 2 * 2 + 2 == 6
      # if tweets_count be 100 then suffix_size will be 3 * 3 + 2 == 6
      # extra 2 size for / & space
      #---------------------
      @@suffix_size = tweets_count.to_s.size * 2 + 2

      # adjust suffix size if have possibility of over flow with average size
      if @@suffix_size + (@@tweet_text.size / tweets_count.to_f) > MAX_CHAR_COUNT
        @@suffix_size = (tweets_count + 1).to_s.size * 2 + 2
      end

      @@suffix_size
    end

    def self.max_content_size
      # memoization of the calculation
      @@max_content_size ||= MAX_CHAR_COUNT - suffix_size
    end

    private_class_method :generate_tweets, :valid_content_size?, :tweets_with_sufix, :max_content_size, :suffix_size
  end
end
