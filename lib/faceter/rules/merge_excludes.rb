# encoding: utf-8

module Faceter

  # Collection of optimization rules for AST
  #
  module Rules

    # Merges two consecutive nodes that exclude keys
    #
    # @api private
    #
    class MergeExcludes < AbstractMapper::PairRule

      # Selects 'exclude' + 'exclude' pairs
      #
      # @private
      #
      def optimize?
        left.instance_of?(Nodes::Exclude) && right.instance_of?(Nodes::Exclude)
      end

      # @private
      def optimize
        Nodes::Exclude.new(*left.attributes, *right.attributes)
      end

    end # class MergeExcludes

  end # module Rules

end # module Faceter
