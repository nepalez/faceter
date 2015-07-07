module Faceter

  module Nodes

    # The node describes exclusion of the field from a tuple
    #
    # @api private
    #
    class Exclude < AbstractMapper::Node

      # @!scope class
      # @!method new(*keys)
      # Creates the node
      #
      # @example
      #   Exclude.new :bar, :baz
      #
      # @param [Object, Array] keys The key or list of keys to be excluded
      # @param [Hash] options
      #
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::Exclude]

      # @private
      def initialize(*keys, **options)
        @blacklist = keys.any? ? keys.flatten : Array[*options[:only]]
        @whitelist = Array[*options[:except]]
        super
      end

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        if @whitelist.any?
          Functions[:accept_keys, @whitelist]
        else
          Functions[:reject_keys, @blacklist]
        end
      end

    end # class Exclude

  end # module Nodes

end # module Faceter
