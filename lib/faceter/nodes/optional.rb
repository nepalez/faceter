module Faceter

  module Nodes

    # The base class for all nodes that take standard options along with
    # the alternative set of keys
    #
    # @abstract
    #
    # @api private
    #
    class Optional < AbstractMapper::Node

      # @private
      def initialize(*keys, **options)
        @options = (keys.any? ? { only: keys.flatten } : {}).update(options)
        super
      end

    end # class Exclude

  end # module Nodes

end # module Faceter
