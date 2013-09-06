# Archimedes

[![Build Status](https://travis-ci.org/shopkeep/archimedes.png?branch=master)](https://travis-ci.org/shopkeep/archimedes)

A lightweight wrapper for StatsD and it's configuration.

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
    Archimedes.config = Archimedes::Config.from(:yaml, file: file, base: base)

##### Send some metrics

    Archimedes.increment('foo')

    Archimedes.decrement('foo')

    Archimedes.count('foo', 30)

    Archimedes.gauge('production.deployments', 1)

    Archimedes.time('foo') do
        zomg_long_task
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
