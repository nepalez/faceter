module Faceter

  module Nodes

    # The composed node that describes a field of tuples in input data
    #
    # @api private
    #
    class Field < AbstractMapper::Branch

      # @!scope class
      # @!method new(name)
      # Creates the node for the named field
      #
      # @example
      #   Field.new(:foo)
      #
      # @param [Object] name The name of the field (a tuple key)
      #
      # @return [Faceter::Nodes::Field]

      # @private
      def initialize(name)
        @name = name
        super
      end

      # Builds a transproc function for the field node from its child nodes
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[:map_value, @name, super]
      end

    end # class Field

  end # module Nodes

end # module Faceter
