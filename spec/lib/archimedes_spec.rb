require 'spec_helper'

describe Archimedes do

  before do
    @config = stub(host: 'example.org', port: 9999, namespace: 'test.archimedes')
    @archimedes = described_class.new(@config)
  end

  describe '.increment' do
    it 'calls the service\'s count method with 1' do
      @archimedes.service.expects(:count).with('foo.metric', 1, 1)
      @archimedes.increment('foo.metric')
    end

    it 'passes the rate along if present' do
      @archimedes.service.expects(:count).with(anything, 1, 0.25)
      @archimedes.increment(anything, 0.25)
    end
  end

  describe '.decrement' do
    it 'calls the service\'s count method with -1' do
      @archimedes.service.expects(:count).with('bar.metric', -1, 1)
      @archimedes.decrement('bar.metric')
    end

    it 'passes the rate along if present' do
      @archimedes.service.expects(:count).with(anything, -1, 0.9)
      @archimedes.decrement(anything, 0.9)
    end
  end

  describe '.count' do
    it 'calls the service\'s count method with the count size' do
      @archimedes.service.expects(:count).with('baz.metric', 12, 1)
      @archimedes.count('baz.metric', 12)
    end

    it 'passes the rate along if present' do
      @archimedes.service.expects(:count).with(anything, -15, 0.75)
      @archimedes.count(anything, -15, 0.75)
    end
  end

  describe '.gauge' do
    it 'calls the service\'s gauge method' do
      @archimedes.service.expects(:gauge).with('sk.gauge', 11, 1)
      @archimedes.gauge('sk.gauge', 11)
    end

    it 'passes the rate along if present' do
      @archimedes.service.expects(:gauge).with(anything, 6, 0.1)
      @archimedes.gauge(anything, 6, 0.1)
    end
  end

  describe '.time' do
    it 'calls the service\'s time method' do
      @archimedes.service.expects(:time).with('sk.time', 1)
      @archimedes.time('sk.time') {}
    end

    it 'passes the rate along if present' do
      @archimedes.service.expects(:time).with('sk.time', 0.1)
      @archimedes.time('sk.time', 0.1) {}
    end
  end

  describe '.timing' do
    it 'defaults the duration to 1' do
      @archimedes.service.expects(:timing).with('sk.timing', 1)
      @archimedes.timing('sk.timing')
    end

    it 'passes the duration along if present' do
      @archimedes.service.expects(:timing).with('sk.timing', 320)
      @archimedes.timing('sk.timing', 320)
    end
  end
end
