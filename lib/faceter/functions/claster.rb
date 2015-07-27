# encoding: utf-8

module Faceter

  module Functions

    # Break the array to array of consecutive items that matches each other
    # by given function
    #
    # @param [Array] list
    # @param [#call] fn
    #
    # @return [Array]
    #
    def self.claster(list, fn)
      list.each_with_object([[]]) do |e, a|
        if a.last.eql?([]) || fn[e].equal?(fn[a.last.last])
          a.last << e
        else
          a << [e]
        end
      end
    end

  end # module Functions

end # module Faceter
