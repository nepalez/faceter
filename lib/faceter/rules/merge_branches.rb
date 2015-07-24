# encoding: utf-8

module Faceter

  # Collection of optimization rules for AST
  #
  module Rules

    # Merges two consecutive branches of the same type
    #
    # @api private
    #
    class MergeBranches < AbstractMapper::PairRule

      # @private
      def optimize?
        left.is_a?(AbstractMapper::Branch) &&
          right.class.equal?(__left_node__) &&
          right.attributes.eql?(__left_attributes__)
      end

      # @private
      def optimize
        __left_node__.new(__left_attributes__) { nodes.flat_map(&:entries) }
      end

      private

      def __left_node__
        left.class
      end

      def __left_attributes__
        left.attributes
      end

    end # class MergeBranches

  end # module Rules

end # module Faceter
