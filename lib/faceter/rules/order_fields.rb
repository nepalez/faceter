# encoding: utf-8

module Faceter

  module Rules

    # Orders consecutive fields by their names to allow merging them later
    #
    class OrderFields < AbstractMapper::Rules::Base

      # @private
      def optimize?
        true
      end

      # @private
      def optimize
        Functions[:claster, -> v { v.class }][nodes].flat_map do |list|
          list.last.instance_of?(Nodes::Field) ? list.sort_by(&:key) : list
        end
      end

    end # class OrderFields

  end # module Rules

end # module Faceter
