# encoding: utf-8

module Faceter

  module Functions

    # Reverses black and white lists in options
    #
    # @example
    #   fn = Functions[:reverse]
    #   fn[except: :foo, only: :bar] # => { except: :bar }
    #   fn[except: :foo]             # => { only: :foo   }
    #   fn[]                         # => { only: []     }
    #
    # @param [Hash] options ({})
    #
    # @option options [Object, Array] :only
    #   The white list of applicable keys
    # @option options [Object, Array] :except
    #   The black list of applicable keys
    #
    # @return [Hash]
    #
    def self.reverse(options = {})
      whitelist = options[:only]
      blacklist = options[:except]

      return { except: whitelist } if whitelist
      return { only: blacklist }   if blacklist
      { only: [] }
    end

  end # module Functions

end # module Faceter
