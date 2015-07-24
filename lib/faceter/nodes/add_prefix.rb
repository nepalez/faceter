module Faceter

  module Nodes

    # The node describes adding prefix from tuples' keys
    #
    # @api private
    #
    class AddPrefix < ChangePrefix

      private

      def __operation__
        :add_prefix
      end

    end # class AddPrefix

  end # module Nodes

end # module Faceter
