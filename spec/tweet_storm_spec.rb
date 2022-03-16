require_relative '../lib/tweet_storm/generator'
require_relative 'test_data_generator'
require_relative '../lib/tweet_storm/exceptions'

RSpec.describe TweetStorm::Generator do
  describe '.call' do
    context 'with tweet size < 140' do
      it 'return single tweet without suffix' do
        tweet = 'Very short tweet'
        expect(described_class.call(tweet)).to match_array [tweet]
      end

      it 'return single tweet including white space' do
        tweet_text = '          Very           short       tweet        '
        expect(described_class.call(tweet_text)).to match_array [tweet_text]
      end
    end

    context 'with tweet size == 140' do
      it 'return single tweet without suffix' do
        # rubocop:disable Layout/LineLength
        tweet = TestDataGenerator.random_text(140)
        expect(described_class.call(tweet)).to match_array [tweet]
      end
    end

    context 'with tweet size > 140' do
      it 'return single two tweets with suffix' do
        # rubocop:disable Layout/LineLength
        tweet_with_141_chars = TestDataGenerator.random_text(141)
        tweets = described_class.call(tweet_with_141_chars)
        expect(tweets.last).to end_with('2/2')
        expect(tweets.first).to end_with('1/2')
      end

      it 'generate exception with word size > 140' do
        tweet_with_large_word = TestDataGenerator.random_word(141)
        expect { described_class.call(tweet_with_large_word) }.to raise_error(TweetStorm::WordSizeExceedLimit::MSG)
      end

      it 'generate exception with one word size 139' do
        large_word = TestDataGenerator.random_word(139)
        tweet = "#{large_word} foo"
        expect { described_class.call(tweet) }.to raise_error(TweetStorm::WordSizeExceedLimit::MSG)
      end

      it 'generate minimal size suffix' do
        large_words = (1..8).map { TestDataGenerator.random_word(136) }
        tweet = large_words.join(' ')
        expect(described_class.call(tweet).last).to end_with '8/8'
      end

      it 'generate exception as size will be exceed with larger suffix' do
        # suffix size will be 3 * 3 + 2 = 8
        large_words = (1..100).map { TestDataGenerator.random_word(133) }
        tweet = large_words.join(' ')
        expect { described_class.call(tweet) }.to raise_error(TweetStorm::WordSizeExceedLimit::MSG)
      end
    end
  end
end
