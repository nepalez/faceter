module Faceter

  module Nodes

    # The node describes adding prefix from tuples' keys
    #
    # @api private
    #
    class AddPrefix < ChangePrefix

      # @!scope class
      # @!method new(prefix, options)
      # Creates the node
      #
      # @example
      #   AddPrefix.new "user", separator: ".", nested: true
      #
      # @param [#to_s] prefix The prefix to be added to keys
      # @param [Hash] options
      #
      # @option options [#to_s] :separator ("_")
      # @option options [Boolean] :nested (false)
      #   Whether the prefix should be added deeply
      # @option (see Faceter::Functions.reverse)
      #
      # @return [Faceter::Nodes::AddPrefix]

      private

      def __operation__
        :add_prefix
      end

    end # class AddPrefix

  end # module Nodes

end # module Faceter
