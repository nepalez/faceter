# encoding: utf-8

module Faceter

  module Rules

    # Does the same as [Faceter::Rules::PrependNested] in case
    # 'nested' transformation follows the `List`, not prepends it.
    #
    # @api private
    #
    class AppendNested < AbstractMapper::Rules::Pair

      # @private
      def optimize?
        left.instance_of?(Nodes::List) && right.respond_to?(:nested)
      end

      # @private
      def optimize
        Nodes::List.new { left.entries + (right.nested ? [right] : []) }
      end

    end # class AppendNested

  end # module Rules

end # module Faceter
