# frozen_string_literal: true

module TweetStorm
  # Exception for large word
  class WordSizeExceedLimit < StandardError
    MSG = 'Word size can not be > allowed tweet size'

    def initialize
      super(self.class::MSG)
    end
  end

  # Exception for large input text
  class InputTextSizeExceedLimit < StandardError
    MSG = 'Input tweet text can not be > allowed size'

    def initialize
      super(self.class::MSG)
    end
  end
  
  # Exception for large input text
  class InvalidArray < StandardError
    MSG = 'Expecting array as the input'

    def initialize
      super(self.class::MSG)
    end
  end
end
