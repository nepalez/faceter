module Faceter

  module Nodes

    # The node describes removing prefix from tuples' keys
    #
    # @api private
    #
    class RemovePrefix < ChangePrefix

      # @!scope class
      # @!method new(prefix, options)
      # Creates the node
      #
      # @example
      #   RemovePrefix.new "user", separator: ".", nested: true
      #
      # @param [#to_s] prefix The prefix to be excluded
      # @param [Hash] options
      #
      # @option (see Faceter::Nodes::AddPrefix.new)
      #
      # @return [Faceter::Nodes::RemovePrefix]

      private

      def __operation__
        :drop_prefix
      end

    end # class RemovePrefix

  end # module Nodes

end # module Faceter
