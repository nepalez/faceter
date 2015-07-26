# encoding: utf-8

module Faceter

  # Collection of functions to coerce command arguments to node attributes
  #
  # @api private
  #
  module Coercers

    extend Transproc::Registry

    # @private
    def self.prefix(prefix, **options)
      filter = options.fetch(:separator) { "_" }
      nested = options.fetch(:nested) { false }
      selector = Selector.new(options) if options[:except] || options[:only]
      { prefix: prefix, separator: filter, nested: nested, selector: selector }
    end

    # @private
    def self.unwrap(*keys, **options)
      key = options.fetch(:from)
      opts = (keys.any? ? { only: keys } : {}).merge(options)
      { key: key, selector: Selector.new(opts) }
    end

    # @private
    def self.wrap(*keys, **options)
      key = options.fetch(:to)
      opts = (keys.any? ? { only: keys } : {}).merge(options)
      { key: key, selector: Selector.new(opts) }
    end

    # @private
    def self.unfold(**options)
      { key: options.fetch(:from) }
    end

    # @private
    def self.exclude(*keys, **options)
      opts = keys.any? ? { only: keys } : options
      { selector: Selector.new(opts) }
    end

    # @private
    def self.create(name, **options)
      { name: name, keys: options[:from] }
    end

    # @private
    def self.field(key)
      { key: key }
    end

    # @private
    def self.fold(**options)
      { key: options.fetch(:to) }
    end

    # @private
    def self.rename(name, **options)
      { keys: { name => options.fetch(:to) } }
    end

  end # module Coercers

end # module Faceter
