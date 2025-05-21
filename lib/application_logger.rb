# frozen_string_literal: true

class ApplicationLogger
  @logger = Logger.new($stdout)
  @logger.level = Logger::DEBUG

  def self.log(message)
    @logger.debug(message)
  end

  def self.error(message)
    @logger.error(message)
  end

  def self.info(message)
    @logger.info(message)
  end

  def self.warn(message)
    @logger.warn(message)
  end
end
