module Faceter

  module Nodes

    # The node describes removing prefix from tuples' keys
    #
    # @api private
    #
    class RemovePrefix < ChangePrefix

      private

      def __operation__
        :drop_prefix
      end

    end # class RemovePrefix

  end # module Nodes

end # module Faceter
