class Invidious::Jobs::RefreshSessionTokens < Invidious::Jobs::BaseJob
  def initialize
  end

  def begin
    loop do
      SessionTokens.refresh_tokens
      LOGGER.info("RefreshTokens: Done, sleeping for 5 seconds")
      sleep 5.seconds
      Fiber.yield
    end
  end
end
