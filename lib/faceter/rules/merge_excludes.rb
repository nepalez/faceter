# encoding: utf-8

module Faceter

  # Collection of optimization rules for AST
  #
  module Rules

    # Merges two consecutive nodes that exclude keys
    #
    # @api private
    #
    class MergeExcludes < AbstractMapper::Rules::Pair

      # @private
      def optimize?
        nodes.map { |node| node.instance_of? Nodes::Exclude }.reduce(:&)
      end

      # @private
      def optimize
        Nodes::Exclude.new(selector: nodes.map(&:selector).reduce(:|))
      end

    end # class MergeExcludes

  end # module Rules

end # module Faceter
