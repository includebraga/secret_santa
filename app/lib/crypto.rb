module Crypto
  class << self
    def unique_token
      token_candidate = new_random_token

      loop do
        break unless yield token_candidate
        token_candidate = new_random_token
      end

      token_candidate
    end

    private

    def new_random_token
      SecureRandom.urlsafe_base64(32)
    end
  end
end
