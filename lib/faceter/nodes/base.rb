# encoding: utf-8

module Faceter

  module Nodes

    # Abstract class describes the node of AST
    #
    # Defines the composable `#selector` extracted from options
    #
    # @abstract
    #
    # @api private
    #
    class Base < AbstractMapper::Node

      # @!attribute [r] selector
      #
      # @return [Selector] The composable selector
      #
      attr_reader :selector

      # @!scope class
      # @!method new(*keys, **options)
      #
      # @param [Object, Array<Object>] keys
      # @param [Hash] options
      #
      # @return [Faceter::Nodes::Base]

      # @private
      def initialize(*keys, **options)
        opts = (keys.any? ? { only: keys } : {}).update(options)
        @selector = Selector.new(opts) if opts.is_a? Hash
        super
      end

    end # class Base

  end # module Nodes

end # module Faceter
