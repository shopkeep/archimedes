require 'isomer'

class Archimedes
  class Config < Isomer::Base
    parameter :host, default: '127.0.0.1'
    parameter :port, default: 8125

    parameter :namespace
    parameter :logger
  end
end
