# encoding: utf-8

module Faceter

  module Rules

    # Merges two consecutive renames
    #
    # @api private
    #
    class MergeRenames < AbstractMapper::PairRule

      # @private
      def optimize?
        nodes.map { |node| node.instance_of? Nodes::Rename }.reduce(:&)
      end

      # @private
      def optimize
        Nodes::Rename.new keys: nodes.map(&:keys).reduce(:merge)
      end

    end # class MergeRenames

  end # module Rules

end # module Faceter
