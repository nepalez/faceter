# encoding: utf-8

module Faceter

  module Rules

    # Merges two consecutive renames
    #
    # @api private
    #
    class MergeRenames < AbstractMapper::PairRule

      # Selects 'rename' + 'rename' pairs
      #
      # @private
      #
      def optimize?
        left.instance_of?(Nodes::Rename) && right.instance_of?(Nodes::Rename)
      end

      # @private
      def optimize
        left_hash  = left.attributes.first
        right_hash = right.attributes.first
        Nodes::Rename.new left_hash.merge(right_hash)
      end

    end # class MergeRenames

  end # module Rules

end # module Faceter
