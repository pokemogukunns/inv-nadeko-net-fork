class Invidious::Jobs::CheckExternalProxy < Invidious::Jobs::BaseJob
  def initialize
  end

  def begin
    loop do
      HttpServer::Utils.check_external_proxy
      LOGGER.info("CheckExternalProxy: Done, sleeping for 10 seconds")
      sleep 10.seconds
      Fiber.yield
    end
  end
end
