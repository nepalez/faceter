# encoding: utf-8

module Faceter

  module Rules

    # Optimizes AST by moving nested nodes from the array level to one
    # level deeper:
    #
    # @example Removes unnecessary iterations by the same array.
    #   prefix "foo", nested: true
    #   list do
    #     # ...
    #   end
    #
    #   # Becomes:
    #   list do
    #     prefix "foo", nested: true
    #     # ...
    #   end
    #
    # @example Removes "flat" operation that cannot be applied to non-hashes
    #   prefix "foo", nested: false
    #   list do
    #     # ...
    #   end
    #
    #   # Becomes:
    #   list do
    #     # ...
    #   end
    #
    # @api private
    #
    class PrependNested < AbstractMapper::PairRule

      # Selects 'node with :nested option' + 'list' for merging
      #
      # @private
      #
      def optimize?
        right.instance_of?(Nodes::List) && left.respond_to?(:nested)
      end

      # @private
      def optimize
        Nodes::List.new { (left.nested ? [left] : []) + right.entries }
      end

    end # class PrependNested

  end # module Rules

end # module Faceter
