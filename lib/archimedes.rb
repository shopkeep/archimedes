require 'archimedes/config'
require 'archimedes/version'
require 'statsd'

class Archimedes
  attr_reader :service

  def initialize(config)
    @config  = config
    @service = Statsd.new(@config.host, @config.port)
    @service.namespace = @config.namespace
  end

  def increment(metric, rate = 1)
    count(metric, 1, rate)
  end

  def decrement(metric, rate = 1)
    count(metric, -1, rate)
  end

  def count(metric, delta, rate = 1)
    service.count(metric, delta, rate)
  end

  def gauge(metric, value, rate = 1)
    service.gauge(metric, value, rate)
  end

  def time(metric, rate = 1)
    service.time(metric, rate) do
      yield
    end
  end

  def timing(metric, duration = 1)
    service.timing(metric, duration)
  end
end
