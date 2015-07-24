module Faceter

  module Nodes

    # The node describes creating a new value from values by keys
    #
    # @api private
    #
    class Create < AbstractMapper::Node

      attribute :name
      attribute :keys

      # Transformer function, defined by the node
      #
      # @return [Transproc::Function]
      #
      def transproc
        Functions[__fn__]
      end

      private

      def __fn__
        return __proc__ unless name
        -> hash { hash.merge(name => __proc__[hash]) }
      end

      def __proc__
        return __values__ unless block
        -> hash { block[*__values__[hash]] }
      end

      def __values__
        return -> hash { hash[keys] } unless keys.instance_of?(Array)
        -> hash { hash.values_at(*keys) }
      end

    end # class Create

  end # module Nodes

end # module Faceter
