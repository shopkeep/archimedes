# Archimedes

[![Build Status](https://travis-ci.org/shopkeep/archimedes.png?branch=master)](https://travis-ci.org/shopkeep/archimedes) [![Code Climate](https://codeclimate.com/github/shopkeep/archimedes.png)](https://codeclimate.com/github/shopkeep/archimedes)

A lightweight wrapper for StatsD and its configuration.

## Installation

Add this line to your application's Gemfile:

    gem 'archimedes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install archimedes

## Usage

Archimedes uses [Isomer](https://github.com/pguelpa/isomer) for managing it's configuration.

##### Example archimedes.yml

    development:
      port: 1234
      namespace: 'foo.bar'
      host: 'example.org'

##### Configure Archimedes

    file = Rails.root.join('config', 'archimedes.yml')
    base = Rails.env
    config = Archimedes::Config.from(:yaml, file: file, base: base)

    ARCHIMEDES = Archimedes.new(config)

##### Send some metrics

    ARCHIMEDES.increment('foo')

    ARCHIMEDES.decrement('foo')

    ARCHIMEDES.count('foo', 30)

    ARCHIMEDES.gauge('production.deployments', 1)

    ARCHIMEDES.timing('foo', 300)

    ARCHIMEDES.time('foo') do
      zomg_long_task
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
