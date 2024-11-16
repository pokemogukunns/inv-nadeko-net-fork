module Tokens
  extend self
  @@po_token : String | Nil
  @@visitor_data : String | Nil

  def refresh_tokens
    @@po_token = REDIS_DB.get("invidious:po_token")
    @@visitor_data = REDIS_DB.get("invidious:visitor_data")
    if !@@po_token.nil? && !@@visitor_data.nil?
      LOGGER.debug("RefreshTokens: Successfully updated tokens")
    else
      LOGGER.warn("RefreshTokens: Tokens are empty!")
    end
    LOGGER.trace("RefreshTokens: Tokens are:")
    LOGGER.trace("RefreshTokens: po_token: #{@@po_token}")
    LOGGER.trace("RefreshTokens: visitor_data: #{@@visitor_data}")
  end

  def get_tokens
    return {@@po_token, @@visitor_data}
  end

  def get_po_token
    return @@po_token
  end

  def get_visitor_data
    return @@visitor_data
  end
end
