require_relative '../lib/tweet_storm/exceptions'
require_relative '../lib/tweet_storm'

RSpec.describe TweetStorm::App do
  describe '.run' do
    it 'execute by taking array input' do
      described_class.run(['Foo'])
    end

    it 'execute raise error if passing parameter is not array' do
      expect { described_class.run('text') }.to raise_error(TweetStorm::InvalidArray::MSG)
    end
  end
end
